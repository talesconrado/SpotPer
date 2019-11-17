const express = require('express');
const db = require('../database');

const AlbumModel = require('../model/album');

const router = express.Router();

const pool = db.pool(process.env);
const poolConnection = pool.connect();

const album = new AlbumModel(pool);

router.get('/', (req, res, next) => {
	poolConnection
		.then(() => album.getAlbums())
		.then(albums => res.status(200).json(albums.recordset))
		.catch(err => next(err));
});

router.get('/id/:id', (req, res, next) => {
	const id = req.params.id;

	if(!id) {
		res.status(400).json({ status: 400, msg: `You need pass a id params` });
	}

	poolConnection
		.then(() => album.getAlbumById(id))
		.then(albums => {
			const data = albums.recordset;

			if (data.length > 0) {
				res.status(200).json(data[0]);
			} else {
				res.status(404).json({ status: 404, msg: `Album with ${id} is not found!` });
			}
		})
		.catch(err => next(err));
});

router.get('/name/:name', (req, res, next) => {
	const name = req.params.name;

	if (!name) {
		res.status(400).json({ status: 400, msg: `You need pass a name params` });
	}

	poolConnection
		.then(() => album.getAlbumByName(name))
		.then(albums => {
			const data = albums.recordset;

			if (data.length > 1) {
				res.status(200).json(data);
			} else if (data.length > 0) {
				res.status(200).json(data[0]);
			} else {
				res.status(404).json({ status: 404, msg: `Album with ${name} is not found` });
			}
		})
		.catch(err => next(err));
});

router.get('/price',
	(req, res, next) => {
		const bigger = req.query.biggerThan;

		if (bigger) {
			poolConnection
				.then(() => album.getAlbumBiggerThan(bigger))
				.then(albums => {
					const data = albums.recordset;

					if (data.length > 1) {
						res.status(200).json(data);
					} else if (data.length > 0) {
						res.status(200).json(data[0]);
					} else {
						res.status(404).json({ status: 404, msg: `Album with price bigger than ${bigger} is not found` });
					}
				})
				.catch(err => next(err));
		} else {
			next();
		}
	},

	(req, res, next) => {
		const less = req.query.lessThan;

		if (less) {
			poolConnection
				.then(() => album.getAlbumLessThan(less))
				.then(albums => {
					const data = albums.recordset;

					if (data.length > 1) {
						res.status(200).json(data);
					} else if (data.length > 0) {
						res.status(200).json(data[0]);
					} else {
						res.status(404).json({ status: 404, msg: `Album with price less than ${less} is not found` });
					}
				})
				.catch(err => next(err));
		} else {
			next();
		}
	},

	(req, res, next) => {
		const less = req.query.less;
		const bigger = req.query.bigger;

		console.log(less, bigger);

		if (less && bigger) {
			poolConnection
				.then(() => album.getAlbumBetween(less, bigger))
				.then(albums => {
					const data = albums.recordset;

					if(!data) {
						res.status(400).json({ status: 400, msg: `bigger query needs to be bigger tha less query` });
					}

					if (data.length > 1) {
						res.status(200).json(data);
					} else if (data.length > 0) {
						res.status(200).json(data[0]);
					} else {
						res.status(404).json({ status: 404, msg: `Album with price between ${less} and ${bigger} is not found` });
					}
				})
				.catch(err => next(err));
		} else {
			res.status(400).json({ status: 400, msg: 'You need pass biggerThan or lessThan or both less and bigger' });
		}
	}

);

router.use((err, req, res, next) => {
	console.error('Internal Error', err);

	res.status(500).json({ status: 500, msg: err.message });
});

module.exports = router;
