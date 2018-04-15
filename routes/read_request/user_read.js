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
          res.status(200).json( { "error": "Password Incorrect" });
      }else{
         res.status(200).json( { "error": "success","id_user": result.rows[0].user_id } );
      }
    }
  });
  
});

router.post('/update_user', function(req,res,next){
  params = req.body;
  console.log('update of user: '+params);
  bd.query('UPDATE app_user SET first_name= $2, password = $3, email_address = $4, area = $5, institution = $6   WHERE user_id = $1',[params.id,params.name, params.new_pass, params.email, params.area, params.institution],function(err,result){
      if(err){
          res.status(200).json( { "result": "error" });
      }else{
         res.status(200).json( { "result": "ok" } );
      }
  });
  
});

module.exports = router;
