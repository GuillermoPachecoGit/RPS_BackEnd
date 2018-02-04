var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');


router.get('/get_datasets', function(req,res,next){
  var project_id = req.query.id;
  console.log(project_id);
  bd.query('SELECT dataset_id, dataset_name FROM dataset_json WHERE project_id = $1',[project_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        res.status(200).json(result.rows);
      }
  });
}
);
  

  module.exports = router;