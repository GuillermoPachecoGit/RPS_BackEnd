var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

var R = require("r-script")
var parseJSON = require('../../private_modules/parseR/parseJSON');
var parser = new parseJSON();

//register one user into database
router.post('/register_user', function(req,res,next){
    var username = req.body.name;
    var email = req.body.email;
    var pass = req.body.pass;
    var country = req.body.country;
    var area = req.body.area;
    var institution = req.body.institution; 
    bd.query('INSERT INTO app_user values(DEFAULT,$1, $2, $3, $4, $5, $6)',[pass,area, username, email,institution,country], function(err, result){
       if(err){
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
  var project_id = req.body.project_selected;
  var dataset_id = req.body.dataset_selected;
  var algorithm = req.body.algorithm_selected;
  var show_consensus = req.body.show_consensus_selected;
  var tab_name = req.body.tab_name_analysis;

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
          case 1:
            out = R("r_scripts/ProcrustesCM.R")
            .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']) })
            .callSync();
            prefix = show_consensus ? 'GlsP_' : 'GlsP_Consensus_';
          break;

          case 2:
            out = R("r_scripts/ProcrustesRobust.R")
            .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']), "show_consensus" : show_consensus  })
            .callSync();
            prefix =  show_consensus ? 'GrP_' : 'GrP_Consensus_' ;
          break;
        }

        
        dataParse = parser.parseDataR(out,show_consensus);

        dataParse.colors = data['colors'];

        //special case of CM algorithm
        if(algorithm == 1 && show_consensus){
          var name = 'specimen'+(dataParse.specimens.length);
          var consenso = JSON.parse(out);
          dataParse.specimens.push( { [name] : consenso['consensus'] } );
          dataParse.numbers_of_specimen = dataParse.numbers_of_specimen + 1;
          dataParse.colors.push('#ea0b0b');
        }


        dataParse.project_id = data['project_id'];    
        //reutilizo los nombres 
        if(JSON.stringify(data['specimen_name']) !== JSON.stringify({})){
          dataParse.specimen_name = data['specimen_name'];
        }

        if(show_consensus){
          dataParse.specimen_name.push("Consensus");
        }
        dataParse.dataset_id_ref =  data['dataset_id'];
        dataParse.project_id_ref = data['project_id'];
        
        bd.query('INSERT INTO dataset_json values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) RETURNING dataset_id',[data['project_id'],data['dataset_name'],prefix+data['file_name'],dataParse.numbers_of_specimen,dataParse.numbers_of_landmark,dataParse.dimention,JSON.stringify(dataParse.specimens),JSON.stringify(dataParse.colors),JSON.stringify(dataParse.specimen_name),data['dataset_id'],data['project_id']], function(err, result){
              if(err){
                console.log(err);
                res.status(200).json( { "error": "Error in the connection with database." });
              }
              else{
                //actualizo el nombre
                if(tab_name.length > 0){
                  dataParse.dataset_name = prefix+tab_name;
                }else{
                  dataParse.dataset_name = prefix+data['dataset_name']+'_'+result.rows[0].dataset_id;
                }
                
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
      bd.query('INSERT INTO distance values(DEFAULT,$1,$2,$3,$4,$5,$6) RETURNING distance_id',[data['dataset_id'],data['project_id'],prefix+data['file_name'],JSON.stringify(dataR.data),JSON.stringify(dataR.specimen_name),data['dimention']], function(err, result){
            if(err){
              res.status(200).json( { "error": "Error in the connection with database." });
            }
            else{
              dataR.distance_name = prefix+data['dataset_name']+'_'+result.rows[0].distance_id;
              dataR.distance_id = result.rows[0].distance_id;
              dataR.project_id = data['project_id'];
              dataR.dataset_id = data['dataset_id'];

              bd.query('UPDATE distance SET distance_name = $1 WHERE distance_id = $2',[prefix+data['dataset_name']+'_'+result.rows[0].distance_id,result.rows[0].distancet_id ], function(err, result){
                
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


 router.post('/runOrdination', function(req,res,next){
  var project_id = req.body.project_id;
  var distance_id = req.body.distance_id;
  var algorithm = req.body.algorithm_selected;
  var data;
  //obtengo dataset
  bd.query('SELECT * FROM distance where project_id_ref = $1 and distance_id = $2',[project_id,distance_id],function(err, result){
    if(err){
        res.status(200).json({ "error": "Error in request." });
    }
      else
    {
      data = result.rows[0];
      //corro el algoritmo
      var out;
      var prefix = '';
      var dimention = 0;
      if(data['dimention'] == 3){
        dimention = 2
      }
      else{
        dimention = 2;
      }

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
      

      bd.query('INSERT INTO ordination values(DEFAULT,$1,$2,$3,$4,$5,$6) RETURNING ordination_id,ordination_name',[data['dataset_id_ref'],data['project_id_ref'],data['distance_id'],prefix+data['distance_name'],JSON.stringify(dataR.data),JSON.stringify(data['specimen_name'])], function(err, result){
            if(err){
              res.status(200).json( { "error": "Error in the connection with database." });
            }
            else{
              dataR.ordination_name = prefix+result.rows[0].ordination_name+'_'+result.rows[0].ordination_id;
              dataR.ordination_id = result.rows[0].ordination_id;
              bd.query('UPDATE ordination SET ordination_name = $1 WHERE ordination_id = $2',[prefix+data['distance_name']+'_'+result.rows[0].ordination_id,result.rows[0].ordination_id ], function(err, result){
                if(JSON.stringify(dataR.specimen_name) === JSON.stringify({})){
                  dataR.specimen_name = [];
                  for (let index = 0; index < dataR.dimention; index++) {
                    dataR.specimen_name.push('trace'+index);
                  }
                }
                //it set the colors
                bd.query('SELECT colors FROM dataset_json where project_id = $1 and dataset_id = $2',[project_id, dataR.dataset_id],function(err, result){
                  if(err){
                      res.status(200).json({ "error": "Error in request of specimen colors." });
                  }
                  else
                  {
                      dataR.colors = result.rows[0].colors;
                      res.status(200).json(JSON.stringify(dataR));
                  }
                });
              });
            }
          });
    }
  });
 });

module.exports = router;
