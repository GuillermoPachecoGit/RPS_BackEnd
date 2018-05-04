var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');


//agrega un proyecto a la base de datos
router.post('/addProject',function (req,res,next) {
    var name_project = req.body.name_project;
    var description = req.body.description;
    var id_user = req.body.id_user;


    bd.query('SELECT 1 FROM project WHERE user_id =$2 and project_name = $1;',[name_project,id_user], function(err, result){
      if(err){
        res.status(200).json( { "error": "Error in the connection with database." });
      }
      else{
        console.log(result.rowCount);
        if(result.rowCount == 0){
            bd.query('INSERT INTO PROJECT values(DEFAULT,$1,current_timestamp,$2, $3) RETURNING project_id,project_name;',[description,name_project,id_user], function(err, result){
              if(err){
                res.status(200).json( { "error": "Error in the connection with database." });
              }
              else{
                console.log(result);
                res.status(200).json( { "error": "ok", "result": result.rows[0] });
              }
            });
        }else
        {
          res.status(200).json( { "error": "Already exist another project with the same name. Please change the project name." });
        }
        
      }
    })
  });

module.exports = router;