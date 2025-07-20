// index.js or server.js
const express = require('express');
const app = express();
const port = 3000;

app.get('/otp', (req, res) => {
  const otpCode = req.query.otpCode;
  console.log("OTP Code received:", otpCode);

  if (otpCode === "1234") {
    res.status(200).json({ message: "OTP verified successfully!" });
  } else {
    res.status(400).json({ error: "Invalid OTP" });
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
