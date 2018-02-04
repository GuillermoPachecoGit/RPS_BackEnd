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

  console.log(req.body);
  //console.log(dataset_id);
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
      console.log(data['numbers_of_specimen']);
      console.log(data['numbers_of_landmark']);
      switch(algorithm){

        case true:
          out = R("r_scripts/ProcrustesRobust.R")
          .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']) })
          .callSync();
          prefix = 'GrP_'
        break;

        case false:
          out = R("r_scripts/ProcrustesCM.R")
          .data({file : path})
          .callSync();
          prefix = 'GIsP_'
        break;

      }

      dataParse = parser.parseDataR(out);

      //guardo en la base
      dataParse.project_id = data['project_id'];
      dataParse.dataset_name = prefix + data['dataset_name'];
      dataParse.colors = data['colors'];
      dataParse.names_specimen = data['specimen_name'];
      res.status(200).json(JSON.stringify(dataParse));
       /* bd.query('INSERT INTO dataset_json values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,$8,$9,NULL,NULL)',[data['project_id'],data['name_dataset'],prefix+data['file_name'],dataParse.num_specimens,dataParse.num_landmarks,dataParse.dim,JSON.stringify(dataParse.specimens),JSON.stringify(data['colors']),JSON.stringify(data['specimen_name'])], function(err, result){
           console.log(result);
            if(err){
              console.log(err);
              res.status(200).json( { "error": "Error in the connection with database." });
            }
            else{
              res.status(200).json(JSON.stringify(dataParse));
            }
    
          });*/
    }
  });

  
  

  /*
  dataParse = parser.parseDataR(out);

  //guardo en la base
  dataParse.project_id = params.project_id;
  dataParse.dataset_name = prefix + params.dataset_name;
    bd.query('INSERT INTO dataset_json values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,$8,$9,NULL,NULL)',[params.project_id,params.name_dataset,prefix+params.file_name,dataParse.num_specimens,dataParse.num_landmarks,dataParse.dim,JSON.stringify(dataParse.specimens),JSON.stringify(params.colors),JSON.stringify(params.specimen_name)], function(err, result){
       console.log(result);
        if(err){
          console.log(err);
          res.status(200).json( { "error": "Error in the connection with database." });
        }
        else{
          res.status(200).json(JSON.stringify(dataParse));
        }

      });
      */
 }
);

module.exports = router;
