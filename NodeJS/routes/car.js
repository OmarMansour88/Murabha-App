const express = require('express');
const router = express.Router();
const { getAllCars, getCarDetails } = require('../controller/carController');

// Routes
router.get('/getAllCars', getAllCars);
router.get('/getCarDetails/:car_id', getCarDetails);

module.exports = router;
