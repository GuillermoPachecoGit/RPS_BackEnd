var express = require('express');
var router = express.Router();
var bd=require('../db_connect/db');


//agrega un proyecto a la base de datos
router.post('/addProject',function (req,res,next) {
    var name_project = req.body.name_project;
    var description = req.body.description;
    var id_user = req.body.id_user;
     console.log(req.files);
    if(req.files != undefined){
        var ext = path.extname(req.files[0].originalname);
        if(ext !== '.tps' && ext !== '.nts' && ext !== '.txt') {
        console.log("archivo invalido");
              res.status(200).json( { "error": "error" });
        }
        else{
              var stream = fs.createReadStream('./uploads/'+req.files[0].filename).pipe(fs.createWriteStream('./public/datasets/'+req.files[0].originalname));
              stream.on('finish', function () {
                  //borramos el archivo temporal creado
                  fs.unlink('./uploads/'+req.files[0].filename); 
                  eventEmitter.emit('readFileR',req.files[0].originalname);
              });
      }
    }
    bd.query('INSERT INTO PROJECT values(DEFAULT,$1,current_timestamp,$2, $3)',[description,name_project,id_user], function(err, result){
       console.log(result);
        if(err){
          console.log(err);
          res.status(200).json( { "error": "Error in the connection with database." });
        }
        else{
          res.status(200).json( { "error": "success" });;
        }
      });
  });


  module.exports = router;