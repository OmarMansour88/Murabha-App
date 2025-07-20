const express = require('express');
const axios = require('axios');
const cors = require('cors');

const app = express();
const port = 3000;

// Enable CORS
app.use(cors());

app.get('/customer', async (req, res) => {
  const id = req.query.accountId;

  console.log('➡️ Incoming request to /customer with query:', req.query);

  if (!id) {
    console.warn('⚠️ Missing accountId in query parameters');
    return res.status(400).json({ error: 'Missing ID query parameter' });
  }

  const jbossUrl = `http://192.168.1.5:9089/ApiContainer/api/v1.0.0/party/murabha/customers?accountId=${id}`;

  console.log(`🔗 Sending request to JBoss: ${jbossUrl}`);

  try {
    const response = await axios.get(jbossUrl);

    console.log('✅ Received response from JBoss:', {
      status: response.status,
      data: response.data,
    });

    if (response.data && response.data.body && response.data.body.length > 0) {
       console.log('id , response',id,response.data.body[0].accountId);
      if(response.data.body[0].accountId != id){
        console.log('⚠️ Entered the comparing zone');
        res.status(404).json({ error: 'Customer not found' });
      }
      else{
      res.status(200).json(response.data.body[0]);
      }
    } else {
      console.warn('⚠️ No customer data found in response from JBoss');
      res.status(404).json({ error: 'Customer not found' });
    }

  } catch (error) {
    console.error('❌ Error fetching from JBoss:', error.message);

    if (error.response) {
      console.error('📄 JBoss responded with error:', {
        status: error.response.status,
        data: error.response.data,
      });
    } else if (error.request) {
      console.error('📡 No response received from JBoss:', error.request);
    }

    res.status(500).json({ error: 'Failed to fetch from JBoss' });
  }
});

app.listen(port, () => {
  console.log(`🚀 Node.js API server running at http://localhost:${port}`);
});
