var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

var R = require("r-script")
var parseJSON = require('../../private_modules/parseR/parseJSON');
var parser = new parseJSON();
var nodemailer = require('nodemailer');




router.post('/runAnalize', function(req,res,next){
    var project_id = req.body.project_selected;
    var dataset_id = req.body.dataset_selected;
    var algorithm = req.body.algorithm_selected;
    var show_consensus = req.body.show_consensus_selected;
    var tab_name = req.body.dataset_name;
    var user_id = req.body.user_id;
    
    console.log('Request');
    console.log(req.body);

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
              prefix = !show_consensus ? 'GlsP_' : 'GlsP_Consensus_';
            break;
  
            case 2:
              out = R("r_scripts/ProcrustesRobust.R")
              .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']), "show_consensus" : show_consensus  })
              .callSync();
              prefix =  !show_consensus ? 'GrP_' : 'GrP_Consensus_' ;
            break;
          }
  
          console.log('termine el analisis');
          dataParse = parser.parseDataR(out,show_consensus,algorithm);
          dataParse.colors = data['colors'];
          //special case of CM algorithm
          if(algorithm == 1 && show_consensus){
            var name = 'specimen'+(dataParse.specimens.length);
            var consenso = JSON.parse(out);
            dataParse.specimens.push( { [name] : consenso['consensus'] } );
            dataParse.numbers_of_specimen = dataParse.numbers_of_specimen + 1;
            dataParse.colors.push('#ea0b0b');//aparecera en ROJO
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

          show_consensus = show_consensus ? 1 : 0;
          bd.query('INSERT INTO dataset_json values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,1) RETURNING dataset_id',[data['project_id'],data['dataset_name'],prefix+data['file_name'],dataParse.numbers_of_specimen,dataParse.numbers_of_landmark,dataParse.dimention,JSON.stringify(dataParse.specimens),JSON.stringify(dataParse.colors),JSON.stringify(dataParse.specimen_name),data['dataset_id'],data['project_id'],show_consensus], function(err, result){
                if(err){
                  console.log(err);
                  res.status(200).json( { "error": "Error in the connection with database." });
                }
                else{
                  console.log('inserte ne la base dataset_json');
                  //actualizo el nombre
                  if(tab_name.length > 0){
                    dataParse.dataset_name = prefix+tab_name;
                  }else{
                    dataParse.dataset_name = prefix+data['dataset_name']+'_'+result.rows[0].dataset_id;
                  }
                  dataParse.name = tab_name;
                  dataParse.dataset_id = result.rows[0].dataset_id;
                  bd.query('UPDATE dataset_json SET dataset_name = $1 WHERE dataset_id = $2',[prefix+data['dataset_name']+'_'+result.rows[0].dataset_id,result.rows[0].dataset_id ], function(err, result){

                    bd.query('SELECT first_name,email_address FROM app_user WHERE user_id = $1',[user_id], function(err, result){
                      
                      if(err){
                        console.log(err);
                        res.status(200).json( { "error": "Error in the connection with database." });
                      }

                      console.log('voy a mandar el email');
                      var email_text = 'The analisys: '+ dataParse.dataset_name +'  has finished. Please enter the page to view the results. \n';
                      email_text += 'Best Regards.\nRPS Team';
                      var email_to = result.rows[0].email_address;
                    //send email
                      var transporter = nodemailer.createTransport({
                        service: 'gmail',
                        auth: {
                          user: 'rps.software.unicen@gmail.com',
                          pass: 'rpssoftware'
                        }
                      });
                      
                      var mailOptions = {
                        from: 'rps.software.unicen@gmail.com',
                        to: email_to,
                        subject: 'RPS Online -Finished analisys',
                        text: email_text
                      };
                      
                      transporter.sendMail(mailOptions, function(error, info){
                        if (error) {
                          console.log(error);
                        } else {
                          console.log('Email sent: ' + info.response);
                        }
                      });
                    });


                    


                    //I sent to response at app
                    res.status(200).json(JSON.stringify(dataParse));
                    
                  });
                }   
              });
      }
    });
  
   }
  );



module.exports = router;