var express = require('express');
var router = express.Router();
var bd=require('./db_connect/bd');



router.get('/get_datasets', function(req,res,next){
    var project = req.query.id_project;
  
    bd.query('SELECT dataset_name,numbers_of_landmark FROM dataset WHERE project_id = $1',[project],function(err, result){
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