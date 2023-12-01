require('dotenv').config();
const mysql = require('mysql2/promise');

const options = {
    host: 'mysql-container2',
    user: 'root',
    password: 'tjdtls!',
    port: '3307',
    database: 'flown'
}

const db = mysql.createPool(options)

module.exports = {
  options,
  db
};