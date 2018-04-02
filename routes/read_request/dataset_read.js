var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');


router.get('/get_datasets', function(req,res,next){
  var project_id = req.query.id;
  console.log(project_id);
  bd.query('SELECT dataset_id, dataset_name FROM dataset_json WHERE project_id = $1 AND show_consensus <> 1',[project_id],function(err, result){
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


router.get('/get_only_datasets', function(req,res,next){
  var project_id = req.query.id;
  console.log(project_id);
  bd.query('SELECT dataset_id, dataset_name FROM dataset_json WHERE project_id = $1 AND show_consensus <> 1 AND dataset_id_ref is NULL',[project_id],function(err, result){
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


router.get('/get_analisys', function(req,res,next){
  var project_id = req.query.project_id;
  var dataset_id = req.query.dataset_id;
  console.log(req.query);
  bd.query('SELECT dataset_id, dataset_name FROM dataset_json WHERE project_id_ref = $1  AND dataset_id_ref = $2',[project_id,dataset_id],function(err, result){
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

router.get('/get_distances', function(req,res,next){
  var project_id = req.query.project_id;
  var dataset_id = req.query.dataset_id;
  bd.query('SELECT * FROM distance WHERE project_id_ref = $1 AND dataset_id_ref = $2',[project_id, dataset_id],function(err, result){
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


router.get('/get_datasetById', function(req,res,next){
  var dataset_id = req.query.id;
  bd.query('SELECT * FROM dataset_json WHERE dataset_id = $1',[dataset_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        res.status(200).json(JSON.stringify(result.rows[0]));
      }
  });
});
  
router.get('/get_distanceById', function(req,res,next){
  var distance_id = req.query.id;
  bd.query('SELECT * FROM distance WHERE distance_id = $1',[distance_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        res.status(200).json(JSON.stringify(result.rows[0]));
      }
  });
});

  

  module.exports = router;