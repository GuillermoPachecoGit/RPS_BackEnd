var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

var R = require("r-script")
var parseJSON = require('../../private_modules/parseR/parseJSON');
var parser = new parseJSON();

//register one user into database
router.post('/register_user', function(req,res,next){
    console.log(req.body);
    var username = req.body.name;
    var email = req.body.email;
    var pass = req.body.pass;
    var country = req.body.country;
    var area = req.body.area;
    var institution = req.body.institution; 
    bd.query('INSERT INTO app_user values(DEFAULT,$1, $2, $3, $4, $5, $6)',[pass,area, username, email,institution,country], function(err, result){
       if(err){
         console.log(err);
         console.log(err["code"]);
         switch (err["code"]) {
           case "23514":
               res.status(200).json({ "result" : "Email error format."});
             break;
           case "23505":
               res.status(200).json({ "result" : "The user already exist."});
             break;
           default:
               res.status(200).json({ "result" : "Error database."});
             break;
         }
       }
       else{
         res.status(200).json( { "result": "ok"});;
       }
     });
   });

router.post('/runAnalize', function(req,res,next){
  console.log('llegue al server');
  var project_id = req.body.project_selected;
  var dataset_id = req.body.dataset_selected;
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
          out = R("r_scripts/ProcrustesRobust.R")
          .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']) })
          .callSync();
          prefix = 'GrP_'
        break;

        case 1:
          out = R("r_scripts/ProcrustesCM.R")
          .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']) })
          .callSync();
          prefix = 'GIsP_'
        break;

      }

      dataParse = parser.parseDataR(out);

      //guardo en la base
      dataParse.project_id = data['project_id'];
      dataParse.dataset_name = prefix+data['dataset_name'];
      dataParse.colors = data['colors'];
      dataParse.specimen_name = data['specimen_name'];
      
      bd.query('INSERT INTO dataset_json values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) RETURNING dataset_id',[data['project_id'],data['dataset_name'],prefix+data['file_name'],dataParse.numbers_of_specimen,dataParse.numbers_of_landmark,dataParse.dimention,JSON.stringify(dataParse.specimens),JSON.stringify(data['colors']),JSON.stringify(data['specimen_name']),data['dataset_id'],data['project_id']], function(err, result){
            if(err){
              console.log(err);
              res.status(200).json( { "error": "Error in the connection with database." });
            }
            else{
              dataParse.dataset_name = prefix+data['dataset_name']+'_'+result.rows[0].dataset_id;
              dataParse.dataset_id = result.rows[0].dataset_id;

              bd.query('UPDATE dataset_json SET dataset_name = $1 WHERE dataset_id = $2',[prefix+data['dataset_name']+'_'+result.rows[0].dataset_id,result.rows[0].dataset_id ], function(err, result){
                  res.status(200).json(JSON.stringify(dataParse));
              });
              
            }
    
          });
    }
  });

 }
);



router.post('/runDistance', function(req,res,next){
  var project_id = req.body.project_id;
  var dataset_id = req.body.dataset_id;
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
      console.log(dataR);
            
      bd.query('INSERT INTO distance values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) RETURNING dataset_id',[data['project_id'],data['dataset_name'],prefix+data['file_name'],dataParse.numbers_of_specimen,dataParse.numbers_of_landmark,dataParse.dimention,JSON.stringify(dataParse.specimens),JSON.stringify(data['colors']),JSON.stringify(data['specimen_name']),data['dataset_id'],data['project_id']], function(err, result){
            if(err){
              console.log(err);
              res.status(200).json( { "error": "Error in the connection with database." });
            }
            else{
              dataParse.dataset_name = prefix+data['dataset_name']+'_'+result.rows[0].dataset_id;
              dataParse.dataset_id = result.rows[0].dataset_id;

              bd.query('UPDATE dataset_json SET dataset_name = $1 WHERE dataset_id = $2',[prefix+data['dataset_name']+'_'+result.rows[0].dataset_id,result.rows[0].dataset_id ], function(err, result){
                  res.status(200).json(JSON.stringify(dataParse));
              });
              
            }
    
          });
    }

  });

 });


module.exports = router;
