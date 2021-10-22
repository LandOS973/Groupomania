// get the client
const mysql = require('mysql2');
const { Sequelize } = require('sequelize');

// Create the connection pool. The pool-specific settings are the defaults
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'groupomania',
  password: 'Thomasleboss.31'
});

 
module.exports = pool.promise( console.log("Connexion DB"));
