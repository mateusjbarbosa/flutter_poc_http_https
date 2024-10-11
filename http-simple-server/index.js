import express from 'express';
import ip from 'ip';

const app = express();
const ipAddress = ip.address();
const port = 3000;

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

app.get('/hello', (req, res) => {
  res.json({ message: 'HTTP response from http-simple-server' });
});

app.listen(port, () => {
  console.log(`http-simple-server running at ${ipAddress}:${port}`);
});
