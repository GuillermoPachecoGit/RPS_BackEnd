var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');


router.post('/validate_user', function(req,res,next){

  var email = req.body.email;
  var pass = req.body.pass;

  bd.query('SELECT * FROM app_user WHERE email_address = $1',[email],function(err,result){
    if(result.rows.length == 0){
      res.status(200).json( { "error": "Username does not exist" });
    }else{
      if(result.rows[0].password != pass){
          res.status(500).json( { "error": "Password Incorrect" });
      }else{
         res.status(200).json( { "error": "success","id_user": result.rows[0].user_id } );
      }
    }
  });
  
});

module.exports = router;
