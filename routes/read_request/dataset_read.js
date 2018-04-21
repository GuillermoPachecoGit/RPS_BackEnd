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
  bd.query('SELECT * FROM dataset_json WHERE project_id_ref = $1  AND dataset_id_ref = $2',[project_id,dataset_id],function(err, result){
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

router.get('/get_distances_by_project', function(req,res,next){
  var project_id = req.query.id;
  console.log("llegue al server"+project_id);
  bd.query('SELECT * FROM distance WHERE project_id_ref = $1 ',[project_id],function(err, result){
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

        bd.query('UPDATE dataset_json SET send=0 WHERE dataset_id = $1',[dataset_id],function(err, res){
          if(err){
            console.log(err);
            res.status(200).json({ "error": err});
          }
        });
        res.status(200).json(JSON.stringify(result.rows[0]));
      }
  });
});

router.get('/get_dataset_pending', function(req,res,next){
  var project_id = req.query.id;
  bd.query('SELECT * FROM dataset_json WHERE project_id = $1 AND send = 1',[project_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        res.status(200).json(JSON.stringify(result.rows));
      }
  });
});

router.get('/get_distance_pending', function(req,res,next){
  var project_id = req.query.id;
  bd.query('SELECT * FROM distance WHERE project_id = $1 AND send = 1',[project_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        res.status(200).json(JSON.stringify(result.rows));
      }
  });
});

router.get('/get_ordination_pending', function(req,res,next){
  var project_id = req.query.id;
  bd.query('SELECT * FROM ordination WHERE project_id = $1 AND send = 1',[project_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        res.status(200).json(JSON.stringify(result.rows));
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

        bd.query('UPDATE distance SET send=0 WHERE distance_id = $1',[distance_id],function(err, res){
          if(err){
            console.log(err);
            res.status(200).json({ "error": err});
          }
        });
        res.status(200).json(JSON.stringify(result.rows[0]));
      }
  });
});

  
router.get('/get_ordinations', function(req,res,next){
  var distance_id = req.query.distance_id;
  var dataset_id = req.query.dataset_id;
  var project_id = req.query.project_id;

  bd.query('SELECT * FROM ordination WHERE distance_id_ref = $1 AND dataset_id_ref = $2 AND project_id_ref = $3',[distance_id,dataset_id,project_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        console.log(result.rows);
        res.status(200).json(result.rows);
      }
  });
});

router.get('/get_ordinationById', function(req,res,next){
  var ordination_id = req.query.id;
  

  console.log(ordination_id);
  bd.query('SELECT * FROM ordination WHERE ordination_id = $1',[ordination_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{

        bd.query('UPDATE ordination SET send=0 WHERE ordination_id = $1',[ordination_id],function(err, res){
          if(err){
            console.log(err);
            res.status(200).json({ "error": err});
          }
        });
        res.status(200).json(JSON.stringify(result.rows[0]));
      }
  });
});


router.get('/get_user_by_id', function(req,res,next){
  var user_id = req.query.id;
  
  bd.query('SELECT * FROM app_user WHERE user_id = $1',[user_id],function(err, result){
    if(err){
        console.log(err);
        res.status(200).json({ "error": err});
      }
      else{
        console.log(result.rows);
        res.status(200).json(result.rows[0]);
      }
  });
});


  module.exports = router;