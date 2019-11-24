// Configure enviroment variables
require('dotenv').config();

const express = require('express');

const app = express();

// routers

const album = require('./router/album');
const playlist = require('./router/playlist');
const music = require('./router/music.js');

app.use('/album', album);
app.use('/music', music);
app.use('/playlist', playlist);

app.use((req, res, next) => {
	res.status(404).json({ status: 404, msg: `URL ${req.url} is not found` });
});

const port = process.env.SERVER_PORT;
const domain = (process.env.NODE_ENV === 'development') ? process.env.DB_DEV : process.env.DB_PROD;
app.listen(port, () => {
	console.log(`Servidor rodando em ${domain}:${port}`);
});

