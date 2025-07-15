const db = require('../db/db');

const getAllCars = async (req, res) => {
    try {
        const [cars] = await db.query('SELECT * FROM cars');
        return res.status(200).json({
            status: 'success',
            code: 200,
            message: 'Cars retrieved successfully.',
            data: cars
        });
    } catch (err) {
        console.error('Database error:', err);
        return res.status(500).json({
            status: 'error',
            code: 500,
            message: 'Failed to retrieve cars. Please try again later.'
        });
    }
};

const getCarDetails = async (req, res) => {
    const { car_id } = req.params;

    try {
        const [results] = await db.query(`
            SELECT 
                c.car_id,
                c.VIN,
                c.car_status,
                c.mileage,
                c.condition,
                c.warranty_info,
                c.factory_options,
                c.price,
                c.safety_option,
                m.make_name,
                m.model_name,
                m.model_design,
                e.engine_description,
                e.fuel_type,
                e.horsepower,
                s.shape_name,
                t.transmission_name
            FROM cars c
            JOIN car_models m ON c.model_id = m.model_id
            JOIN engine_types e ON c.engine_id = e.engine_id
            JOIN car_shapes s ON c.shape_id = s.shape_id
            JOIN transmission_types t ON c.transmission_id = t.transmission_id
            WHERE c.car_id = ?
        `, [car_id]);

        if (results.length === 0) {
            return res.status(404).json({
                status: 'fail',
                code: 404,
                message: `Car with ID '${car_id}' not found.`
            });
        }

        res.status(200).json({
            status: 'success',
            code: 200,
            message: 'Car details retrieved successfully.',
            data: results[0]
        });

    } catch (err) {
        console.error('Error fetching car details:', err);
        res.status(500).json({
            status: 'error',
            code: 500,
            message: 'An internal server error occurred.'
        });
    }
};

module.exports = { getAllCars, getCarDetails };
