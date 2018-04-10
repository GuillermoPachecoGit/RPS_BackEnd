var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

var R = require("r-script")
var parseJSON = require('../../private_modules/parseR/parseJSON');
var parser = new parseJSON();

router.post('/runDistance', function(req,res,next){
    var project_id = req.body.project_id;
    var dataset_id = req.body.dataset_id;
    console.log(req.body);
    var algorithm = req.body.algorithm_selected;
    var data;
    //obtengo dataset
    bd.query('SELECT * FROM dataset_json where project_id = $1 and dataset_id = $2',[project_id,dataset_id],function(err, result){
      if(err){
          res.status(200).json({ "error": "Error in request." });
        }
        else{
          data = result.rows[0];
          //corro el algoritmo
        var out;
        var prefix = '';
        switch(algorithm){
  
          case 2:
            out = R("r_scripts/RobustDistance.R")
            .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']) })
            .callSync();
            prefix = 'rD_'
          break;
  
          case 1:
            out = R("r_scripts/CMDistance.R")
            .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']) })
            .callSync();
            prefix = 'lsD_'
          break;
  
        } 
        var dataR  = JSON.parse(out);
        dataR.specimen_name = data['specimen_name'];
        bd.query('INSERT INTO distance values(DEFAULT,$1,$2,$3,$4,$5,$6) RETURNING distance_id',[data['dataset_id'],data['project_id'],prefix+data['file_name'],JSON.stringify(dataR.data),JSON.stringify(dataR.specimen_name),data['dimention']], function(err, result){
              if(err){
                res.status(200).json( { "error": "Error in the connection with database." });
              }
              else{

                console.log(result.rows[0]['distance_id']);
                dataR.distance_name = prefix+data['dataset_name']+'_'+result.rows[0]['distance_id'];
                dataR.distance_id = result.rows[0].distance_id;
                dataR.project_id_ref = data['project_id'];
                dataR.dataset_id_ref = data['dataset_id'];
  
                bd.query('UPDATE distance SET distance_name = $1 WHERE distance_id = $2',[prefix+data['dataset_name']+'_'+result.rows[0].distance_id, dataR.distance_id], function(err, result){
                  
                  console.log(JSON.stringify(dataR.specimen_name) === JSON.stringify({}));
                  if(JSON.stringify(dataR.specimen_name) === JSON.stringify({})){
                    dataR.specimen_name = [];
                    for (let index = 0; index < dataR.dimention; index++) {
                      dataR.specimen_name.push('trace'+index);
                    }
                  }
                  res.status(200).json(JSON.stringify(dataR));
                });              
              }
            });
      }
    });
  
   });
  
   module.exports = router;