var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');


//agrega un proyecto a la base de datos
router.post('/addProject',function (req,res,next) {
    var name_project = req.body.name_project;
    var description = req.body.description;
    var id_user = req.body.id_user;
    bd.query('INSERT INTO PROJECT values(DEFAULT,$1,current_timestamp,$2, $3)',[description,name_project,id_user], function(err, result){
        if(err){
          res.status(200).json( { "error": "Error in the connection with database." });
        }
        else{
          res.status(200).json( { "error": "ok" });;
        }
      });
  });


  module.exports = router;