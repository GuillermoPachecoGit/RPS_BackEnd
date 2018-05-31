var pg = require('pg');


var config = {
  user: 'postgres', //env var: PGUSER 
  database: 'postgres', //env var: PGDATABASE 
  password: 'zaqxsw123', //env var: PGPASSWORD --zaqxsw123 
  host: 'localhost', // Server hosting the postgres database 
  port: 5432, //env var: PGPORT 
  // max number of clients in the pool 
  //idleTimeoutMillis: 30000, // how long a client is allowed to remain idle before being closed 
};

var connection = new pg.Client(config);
 
// connect to our database 
connection.connect(function (err) {
  if (err) throw err;
});

module.exports = connection;

