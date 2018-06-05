var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

var R = require("r-script")
var parseJSON = require('../../private_modules/parseR/parseJSON');
var parser = new parseJSON();

var emailManager = require('../../private_modules/EmailSender');
var senderEmail = new emailManager();



router.post('/runOrdination', function(req,res,next){
    var project_id = req.body.project_id;
    var distance_id = req.body.distance_id;
    var algorithm = req.body.algorithm_selected;
    var data;
    var user_id = req.body.user_id;

   
    //obtengo dataset
    bd.query('SELECT * FROM distance where project_id_ref = $1 and distance_id = $2',[project_id,distance_id],function(err, result){
      if(err){
          res.status(200).json({ "error": "Error in request." });
      }
        else
      {
        data = result.rows[0];
        var out;
        var prefix = '';
        var dimention = 2;
  
        console.log('entrada: '+JSON.stringify(data['data']));

        switch(algorithm){
          case 1:
            out = R("r_scripts/univMDSeucl.R")
            .data({ "data": JSON.stringify(data['data']), dim : dimention })
            .callSync();
            prefix = 'lsUMDS_'
          break;
  
          case 2:
            out = R("r_scripts/univMDSrobust.R")
            .data({"data": JSON.stringify(data['data']), dim : dimention })
            .callSync();
            prefix = 'rUMDS_'
          break;
        }
  
        var dataR  = JSON.parse(out);
        dataR.dataset_id = data['dataset_id_ref'];
        dataR.project_id = data['project_id_ref'];
        dataR.specimen_name = data['specimen_name'];
        
        bd.query('SELECT colors FROM dataset_json where dataset_id = $1',[dataR.dataset_id],function(err, result){
          if(err){
              res.status(200).json({ "error": "Error in request of specimen colors." });
          }
          else
          {
              dataR.colors = result.rows[0].colors;
              console.log(dataR.colors);
              //res.status(200).json(JSON.stringify(dataR));



        bd.query('INSERT INTO ordination values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,0) RETURNING ordination_id,ordination_name',[data['dataset_id_ref'],data['project_id_ref'],data['distance_id'],prefix+data['distance_name'],JSON.stringify(dataR.data),JSON.stringify(data['specimen_name']), JSON.stringify(dataR.colors)], function(err, result){
              if(err){
                console.log(err);
                res.status(200).json( { "error": "Error in the connection with database." });
              }
              else{
                dataR.ordination_name = prefix+result.rows[0].ordination_name+'_'+result.rows[0].ordination_id;
                dataR.name = req.body.ordination_name;
                dataR.ordination_id = result.rows[0].ordination_id;
                bd.query('UPDATE ordination SET ordination_name = $1 WHERE ordination_id = $2',[prefix+data['distance_name']+'_'+result.rows[0].ordination_id,result.rows[0].ordination_id ], function(err, result){
                  if(JSON.stringify(dataR.specimen_name) === JSON.stringify({})){
                    dataR.specimen_name = [];
                    for (let index = 0; index < dataR.dimention; index++) {
                      dataR.specimen_name.push('trace'+index);
                    }
                  }



                  
                  bd.query('SELECT first_name,email_address FROM app_user WHERE user_id = $1',[user_id], function(err, result){
                      
                    if(err){
                      console.log(err);
                      res.status(200).json( { "error": "Error in the connection with database." });
                    }

                    console.log('voy a mandar el email');
                    var email_text = 'The analisys: '+ dataR.ordination_name +'has finished. Please enter the page to view the results. \n';
                    email_text += 'Best Regards.\nRPS Team';
                    var email_to = result.rows[0].email_address;
                    senderEmail.sendEmail(senderEmail.generateMailOptions(email_to,senderEmail.subject().Ordination,email_text));          
                    //I sent to response at app
                   res.status(200).json(JSON.stringify(dataR));               
                });
               });
              }
            });

          }
        });
      }
    });
   });




module.exports = router;
