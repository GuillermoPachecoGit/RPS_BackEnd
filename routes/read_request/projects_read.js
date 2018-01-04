var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');

router.get('/get_projects', function(req,res,next){
    var id_user = req.query.id_user;
  
    bd.query('SELECT project_id,project_name FROM project WHERE user_id = $1',[id_user],function(err, result){
      if(err){
          res.status(500).json({ "error": "Error in request." });
        }
        else{
          res.status(200).json(result.rows);
        }
    });
  }
  );

//obtiene todos los proyectos de un usuario en particular
router.get('/projectsById', function (req,res,next) {
    userId = req.id;

    bd.query('SELECT project_name FROM project WHERE user_id = $1',[userId],function(err,result){
      if(err){
        res.setHeader("Content-Type", "application/json").status(500).json({ "error": "Error in request." });
      }else{
        res.setHeader("Content-Type", "application/json").status(200).json(result.rows);
      }
    });
})

  module.exports = router;