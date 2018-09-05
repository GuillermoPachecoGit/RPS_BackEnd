var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');


router.post('/removeProject', function(req,res,next){
    var project_id = req.body.project_id;

    bd.query('DELETE FROM project WHERE project_id = $1',[project_id], function(err, result){
        if(err){
            res.status(200).json({ "result" : "error"});
        }
        else{
            res.status(200).json( { "result": "ok"});;
        }
    });
});


router.post('/removeDataset', function(req,res,next){
    var dataset_id = req.body.dataset_id;
    bd.query('DELETE FROM dataset WHERE dataset_id = $1',[dataset_id], function(err, result){
        if(err){
            res.status(200).json({ "result" : "error"});
        }
        else{
            console.log(result);
            res.status(200).json( { "result": "ok"});;
        }
    });
});

router.post('/removeDistance', function(req,res,next){
    var distance_id = req.body.distance_id;

    bd.query('DELETE FROM distance WHERE distance_id = $1',[distance_id], function(err, result){
        if(err){
            res.status(200).json({ "result" : "error"});
        }
        else{
            res.status(200).json( { "result": "ok"});;
        }
    });
});


router.post('/removeOrdination', function(req,res,next){
    var ordination_id = req.body.ordination_id;

    bd.query('DELETE FROM project WHERE ordination_id = $1',[ordination_id], function(err, result){
        if(err){
            res.status(200).json({ "result" : "error"});
        }
        else{
            res.status(200).json( { "result": "ok"});;
        }
    });
});

module.exports = router;
