// Configure enviroment variables
require('dotenv').config();

const express = require('express');

const app = express();

// routers
const album = require('./router/album.js');

app.use('/album', album);

const port = process.env.SERVER_PORT;
const domain = (process.env.NODE_ENV === 'development') ? process.env.DB_DEV : process.env.DB_PROD;
app.listen(port, () => {
	console.log(`Servidor rodando em ${domain}:${port}`);
});

