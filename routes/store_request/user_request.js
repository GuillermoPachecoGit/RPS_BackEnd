var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

//register one user into database
router.post('/register_user', function(req,res,next){
    var username = req.body.name_user;
    var email = req.body.email;
    var pass = req.body.pass;
    var country = req.body.country;
    var area = req.body.area;
    var institution = req.body.institution; 
    bd.query('INSERT INTO app_user values(DEFAULT,$1, $2, $3, $4, $5, $6)',[pass, username, email,institution,country,area], function(err, result){
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
         res.status(200).json( { "result": "success"});;
       }
     });
   });

router.get('/get_specimens', function(req,res,next){
  var project = req.query.id_project;
  var dataset = req.query.id_dataset;

  bd.query('SELECT S.specimen_name FROM specimen_for_data SD INNER JOIN specimen S ON (SD.project_id = S.specimen_id) WHERE project_id = $1 AND dataset_id = $2',[project,dataset],function(err, result){
    if(err){
        res.status(500).json({ "error": "Error in request." });
      }
      else{
        //console.log(result);
        res.status(200).json(result.rows);
      }
  });
}
);

module.exports = router;
