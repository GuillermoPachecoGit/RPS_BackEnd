var express = require('express');
var app = express();
var router = express.Router();
var events = require('events');
var eventEmitter = new events.EventEmitter();

var bd=require('./db_connect/db');


/********************Uploads Datasets********************/
var fs = require("fs");
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
var multer = require('multer');
var upload = multer({dest: './temp/'
    });
var path = require('path');

/**********************R-Script**********************/
var R = require("r-script")
var parseJSON = require('../private_modules/parseR/parseJSON');
var parser = new parseJSON();

router.get('/', function (req, res) {
    res.send('Welcome to RPS API');
 })

 router.post("/uploadFile", upload.array("uploads[]", 12), function(req, res) {
    console.log(req.body.project_id);

    var ext = path.extname(req.files[0].originalname);
       if(ext !== '.tps' && ext !== '.nts' && ext !== '.txt') {
        console.log("archivo invalido");
              res.status(200).json( { "error": "error" });
       }
       else{
              var stream = fs.createReadStream('./temp/'+req.files[0].filename).on('error',function(e){console.log(e);}).pipe(fs.createWriteStream('./public/datasets/'+req.files[0].originalname)).on('error',function(e){console.log(e);});
              stream.on('finish', function () {
                  //borramos el archivo temporal creado
                  fs.unlink('./temp/'+req.files[0].filename, function(e) {
                      console.log("success upload");
                      eventEmitter.emit('readFileR',req.files[0].originalname,req.body,res);
                  }); 
              });  
      }
});


//Aca leo el archivo en R
var myEventHandler = function (nameFile,params,res) {
    var path = "./public/datasets/".concat(nameFile);
    var out = R("r_scripts/test.R")
    .data({file : path})
    .callSync();
    
   dataParse = parser.parseDataR(out);

   dataParse.project_id = params.project_id;
   dataParse.dataset_name = params.dataset_name;
     bd.query('INSERT INTO dataset_json values(DEFAULT,$1,$2,$3,$4,$5,$6,$7,$8,$9,NULL,NULL) RETURNING dataset_id',[params.project_id,params.dataset_name,nameFile,dataParse.numbers_of_specimen,dataParse.numbers_of_landmark,dataParse.dimention,JSON.stringify(dataParse.specimens),JSON.stringify(dataParse.colors),JSON.stringify(dataParse.specimen_name)], function(err, result){
        console.log(result);
         if(err){
           console.log(err);
           res.status(200).json( { "error": "Error in the connection with database." });
         }
         else{
           dataParse.dataset_id = result.rows[0].dataset_id;
           res.status(200).json(JSON.stringify(dataParse));
         }

       });
}

//Assign the event handler to an event:
eventEmitter.on('readFileR', myEventHandler);

module.exports = router;