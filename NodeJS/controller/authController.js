const jwt = require('jsonwebtoken');
const db = require('../db/db');

const loginUser = async (req, res) => {
    try {
        const  cif_username = req.body.username;
        var users_password  = req.body.password;
        console.error(req.body.toString());
        // Input validation
        if (!cif_username || !users_password) {
            console.error(`${cif_username} or ${users_password} is missing`);
            return res.status(400).json({
                status: 'fail',
                code: 400,
                message: 'Both username and password are required.'
            });
        }

        // Query user from DB
        const [results] = await db.query(
            'SELECT user_id, cif_username, users_password FROM users WHERE cif_username = ?',
            [cif_username]
        );

        if (results.length === 0 || users_password !== results[0].users_password) {
            return res.status(401).json({
                status: 'fail',
                code: 401,
                message: 'The username or password you entered is incorrect. Please try again.'
            });
        }

        const user = results[0];

        // Generate JWT
        const token = jwt.sign(
            { userId: user.user_id },
            'temp-secret-key',
            { expiresIn: '1h' }
        );

        return res.status(200).json({
            status: 'success',
            code: 200,
            message: 'Login successful.',
            data: { token }
        });

    } catch (err) {
        console.error('Login error:', err);
        return res.status(500).json({
            status: 'error',
            code: 500,
            message: 'An internal server error occurred. Please try again later.'
        });
    }
};

module.exports = { loginUser };
