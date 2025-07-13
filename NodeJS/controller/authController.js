const jwt = require('jsonwebtoken');
const db = require('../db/db');

const loginUser = async (req, res) => {
    try {
        const { username, password } = req.body;

        if (!username || !password) {
            return res.status(400).json({ message: 'Username and password are required' });
        }

        const [results] = await db.query(
            'SELECT id, username, password_hash FROM users WHERE username = ?', 
            [username]
        );

        if (results.length === 0) {
            return res.status(401).json({ message: 'Invalid credentials' });
        }

        const user = results[0];
        
        if (password !== user.password_hash) {
            return res.status(401).json({ message: 'Invalid credentials' });
        }

        const token = jwt.sign({ userId: user.id }, 'temp-secret-key', { expiresIn: '1h' });

        // Return ONLY the token
        return res.json({ token });

    } catch (err) {
        console.error('Login error:', err);
        return res.status(500).json({ message: 'Server error' });
    }
};

module.exports = { loginUser };