const express = require('express');
const app = express();

// Middleware
app.use(express.json());

// Routes
const authRoutes = require('./routes/auth');
const carRoutes = require('./routes/car'); // ✅ Import carRoutes

app.use('/api/auth', authRoutes);
app.use('/api/cars', carRoutes); // ✅ Mount car routes correctly

// Database connection test
const db = require('./db/db');

// Server - hardcoded port
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
});
