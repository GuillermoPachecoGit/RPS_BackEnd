var express = require('express');
var app = express();
var router = express.Router();
/********************Uploads Datasets********************/
var fs = require("fs");
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
var multer = require('multer');
var upload = multer({dest: './temp/'
    });
var path = require('path');

/**********************R-Script**********************/
//var R = require("r-script")

router.get('/', function (req, res) {
    res.send('Welcome to RPS API');
 })

 router.post("/uploadFile", upload.array("uploads[]", 12), function(req, res) {
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
                      //eventEmitter.emit('readFileR',req.files[0].originalname,res);
                      //Test R
                      /*var out = R("ex-sync.R")
                        .data("hello world", 20)
                        .callSync();
                        
                        console.log(out);*/
                  }); 
              });  
      }
});

module.exports = router;