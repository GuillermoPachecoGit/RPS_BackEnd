var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

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
         res.status(200).json( { "result": "ok"});
       }
     });
   });

module.exports = router;
