const express = require('express');
const app = express();
const authRoutes = require('./routes/auth');

// Middleware
app.use(express.json());

// Routes
app.use('/api/auth', authRoutes);

// Database connection test
const db = require('./db/db');

// Server - hardcoded port
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});