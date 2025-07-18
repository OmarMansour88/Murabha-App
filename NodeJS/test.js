const express = require('express');
const axios = require('axios');
const cors = require('cors');

const app = express();
const port = 3000;

// Enable CORS
app.use(cors());

app.get('/customer/:id', async (req, res) => {
  const id = req.params.id;
  const jbossUrl = `http://192.168.1.5:9089/test/api/v1.0.0/party/mbscomar/${id}`;

  try {
    const response = await axios.get(jbossUrl);
    const bodyArray = response.data.body;

    // Check if body is an array
    if (!Array.isArray(bodyArray)) {
      return res.status(500).json({ error: 'Unexpected data format from JBoss' });
    }

    // Find matching accountId
    const match = bodyArray.find(item => item.accountId == id);

    if (match) {
      res.json({message: 'Login Sucessfully'});
    } else {
      res.status(404).json({ message: 'Account ID not found in response body' });
    }

  } catch (error) {
    console.error('Fetch error:', error.message);
    res.status(500).json({ error: 'Failed to fetch data from JBoss' });
  }
});

app.listen(port, () => {
  console.log(`Node.js API server running at http://192.168.1.5:${port}`);
});
