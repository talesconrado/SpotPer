const express = require('express');
const db = require('../database');

const AlbumModel = require('../model/album');

const album = express.Router();

album.get('/', (req, res, next) => {
	db
		.pool(process.env)
		.connect()
		.then(pool => new  AlbumModel(pool))
		.then(album => album.getAlbums())
		.then(albums => res.status(200).json(albums.recordset))
		.catch(err => next(err));
});

album.use((err, req, res, next) => {
	console.error('Internal Error', err);

	res.status(500).json({ status: 500, msg: err });
});


module.exports = album;
