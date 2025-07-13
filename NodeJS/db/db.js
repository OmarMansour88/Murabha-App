const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'admin',
  database: 'car_app_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Test connection
db.getConnection()
  .then(connection => {
    console.log('✅ DB Connected. Thread ID:', connection.threadId);
    connection.release();
  })
  .catch(err => {
    console.error('❌ DB Connection Error:', err);
    process.exit(1);
  });

module.exports = db;