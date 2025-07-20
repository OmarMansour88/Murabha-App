const express = require('express');
const app = express();
const port = 3000;

// GET /verify?otpCode=123456
app.get('/otp', (req, res) => {
  const otpCode = req.query.otpCode;
  if (!otpCode) {
    return res.status(400).json({ error: 'otpCode is required' });
  }

  // You can now use the OTP code (e.g., validate it)
  console.log('Received OTP:', otpCode);

  res.json({ message: 'OTP received successfully', otpCode });
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
