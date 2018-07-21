var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');
var nodemailer = require('nodemailer');

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




router.post('/pass_recovery', function(req,res,next){
  params = req.body;
  console.log("pass: "+params.email);
  bd.query('SELECT email_address,password FROM APP_USER WHERE email_address = $1',[params.email],function(err,result){
      if(err){
          res.status(200).json( { "result": "Error in database" });
      }else{
        console.log('retorne: ' +result.rows);
        if(result.rows[0] != undefined){

          var email = result.rows[0].email_address;
          var password = result.rows[0].password;

          console.log('voy a mandar el email');
                      var email_text = 'Your password is: '+ password +'. Please enter the page and you sign in again. \n';
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
                        subject: 'RPS Online - Recovery password',
                        text: email_text
                      };
                      
                      transporter.sendMail(mailOptions, function(error, info){
                        if (error) {
                          console.log(error);
                        } else {
                          console.log('Email sent: ' + info.response);
                        }
                      });

          res.status(200).json( { "result": "ok" } );
        }else{
          res.status(200).json( { "result": "User does not exist." } );
        }
         
      }
  });
  
});

module.exports = router;
