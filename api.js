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

//Path --> "/api/db_request_dataset_w/"
var storeDataset = require('./routes/store_request/dataset_request');
app.use('/db_request_dataset_w', storeDataset);

//Path --> "/api/db_request_project_w/"
var storeProject = require('./routes/store_request/project_request');
app.use('/db_request_project_w', storeProject);



//Test upload file static
app.use(express.static('public'));

app.get('/index.html', function (req, res) {
   res.sendFile( __dirname + "/" + "index.html" );
})

var server = app.listen(3000, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})