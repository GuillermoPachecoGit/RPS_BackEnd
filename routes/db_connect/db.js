var pg = require('pg');


var config = {
  user: 'postgres', //env var: PGUSER 
  database: 'postgres', //env var: PGDATABASE 
  password: 'zaqxsw123', //env var: PGPASSWORD --zaqxsw123 
  host: 'localhost', // Server hosting the postgres database 
  port: 5432, //env var: PGPORT 
};

var connection = new pg.Client(config);
 
// connect to our database 
connection.connect(function (err) {
  if (err) throw err;
});

module.exports = connection;

