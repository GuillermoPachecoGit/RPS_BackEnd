var express = require('express');
var router = express.Router();
var bd=require('./db_connect/bd');



router.get('/get_countries', function(req,res,next){
    //esta funcion va a devolver todas las filas de la tabla country
    //console.log("llegue hasta aca");
    bd.query('SELECT * FROM country',function(err, result){
      if(err){ 
          res.status(500).json({ "error": "Error in request." });
        }
        else{
          res.status(200).json(result.rows);
        }
      }
    );
});

module.exports = router;