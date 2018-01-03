var express = require('express');
var router = express.Router();
var bd=require('./db_connect/bd');



module.exports = router;

router.post('/validate_user', function(req,res,next){

  console.log(req.body);
  var email = req.body.email;
  var pass = req.body.pass;

  bd.query('SELECT * FROM app_user WHERE email_address = $1',[email],function(err,result){
    console.log(result);
    if(result.rows.length == 0){
      sess = req.session;
      //Session set when user Request our app via URL
      if(sess.email) {
          res.redirect('/admin');
      }
      else {
          res.redirect('dashboard.html');
      }
      res.status(500).json( { "error": "Username does not exist" });
    }else{
      if(result.rows[0].password != pass){
          res.status(500).json( { "error": "Password Incorrect" });
      }else{
         res.status(200).json( { "error": "success","id_user": result.rows[0].user_id } );
      }
    }
  });
  
});
S
module.exports = router;
