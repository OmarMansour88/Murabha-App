const express = require('express');
const router = express.Router();
const { loginUser } = require('../controller/authController');

// Login route
router.post('/login', loginUser);

module.exports = router;