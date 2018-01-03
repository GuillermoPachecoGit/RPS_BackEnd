var express = require('express');
var app = express();

// ROUTES FOR OUR API
// =============================================================================
var router = express.Router();              // get an instance of the express Router
// all of our routes will be prefixed with /api
app.use('/api', router);

//Path --> "/api/" 
var index = require('./routes/index');
app.use('/', index);


app.use(express.static('public'));
app.get('/index.html', function (req, res) {
   res.sendFile( __dirname + "/" + "index.html" );
})

var server = app.listen(3000, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})