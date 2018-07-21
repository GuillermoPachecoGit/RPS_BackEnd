var express = require('express');
var app = express();
//dominios cruzados, web client y servicio en distinto server
var cors = require('cors')
//parsear POST
var bodyParser = require('body-parser');

// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors())
// ROUTES FOR OUR API
// =============================================================================
var router = express.Router();              // get an instance of the express Router
// all of our routes will be prefixed with /api
app.use('/api', router);

//Path --> "/api/" 
var index = require('./routes/index');
app.use('/', index);

/*********READ*********/

//Path --> "/api/db_request_project/"
var readProject = require('./routes/read_request/projects_read');
app.use('/db_request_project', readProject);

//Path --> "/api/db_request_dataset/"
var readDataset = require('./routes/read_request/dataset_read');
app.use('/db_request_dataset', readDataset);

//Path --> "/api/db_request_user/"
var readUser = require('./routes/read_request/user_read');
app.use('/db_request_user', readUser);

//Path --> "/api/db_request_country/"
var readCountry = require('./routes/read_request/countries_read');
app.use('/db_request_country', readCountry);


/*********STORE*********/

//Path --> "/api/db_request_user_w/"
var storeUser = require('./routes/store_request/user_request');
app.use('/db_request_user_w', storeUser);

//Path --> "/api/db_request_ordination_w/"
var ordinationUser = require('./routes/store_request/ordination_request');
app.use('/db_request_ordination_w',ordinationUser);

//Path --> "/api/db_request_distance_w/"
var distanceUser = require('./routes/store_request/distance_request');
app.use('/db_request_distance_w',distanceUser);

//Path --> "/api/db_request_analisys_w/"
var analisysUser = require('./routes/store_request/analisys_request');
app.use('/db_request_analisys_w',analisysUser);

//Path --> "/api/db_request_dataset_w/"
var storeDataset = require('./routes/store_request/dataset_request');
app.use('/db_request_dataset_w', storeDataset);

//Path --> "/api/db_request_project_w/"
var storeProject = require('./routes/store_request/project_request');
app.use('/db_request_project_w', storeProject);

//Path --> "/api/db_request_remove_w/"
var removeManagement = require('./routes/store_request/remove_management');
app.use('/db_request_remove_w', removeManagement);

//Test upload file static
app.use(express.static('public/dist/'));


app.get('/log_out',function (req,res){
    res.end("");
})
app.get('/main/home',function (req,res){
    res.redirect('/');
})

app.get('/main/signin',function (req,res){
    res.redirect('/');
})

app.get('/main/signup',function (req,res){
    res.redirect('/');
})

app.get('/dashboard/*',function (req,res){
    res.redirect('/main/signin');
})


var server = app.listen(80, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})