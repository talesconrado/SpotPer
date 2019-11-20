const express = require('express');
const db = require('../database');
const PlaylistModel = require('../model/playlist');

const router = express.Router();
const pool = db.pool(process.env);

const poolConnection = pool.connect();
const playlist = new PlaylistModel(pool);

router.get('/', (req, res, next) => {
	poolConnection
		.then(() => playlist.getPlaylists())
		.then(playlists => {
			const data = playlists.recordset;

			if (data.length > 1) {
				return data;
			} else if (data.length > 0) {
				return data[0];
			} else {
				return undefined;
			}
		})
		.then(playlists => {
			if (playlists) {
				res.status(200).json(playlists);
			} else {
				res.status(404).json({ status: 404, msg: 'There is no playlist' });
			}
		})
		.catch(err => next(err));
});

router.delete('/del-playlist/:playlistId', (req, res, next) => {
	const playlistId = req.params.playlistId;
	
	poolConnection
		.then(() => playlist.deletePlaylist(playlistId))
		.then(() => res.status(200).json({ status: 200, msg: `playlist with id ${playlistId} deleted` }))
		.catch(err => next(err));
});

router.delete('/del-music/:playlistId/:musicId', (req, res, next) => {
	const { playlistId, musicId } = req.params;

	poolConnection
		.then(() => playlist.deleteMusicOfPlaylist(playlistId, musicId))
		.then(() => res.status(200).json({ status: 200, msg: `music deleted from playlist with id ${playlistId}` }))
		.catch(err => next(err));
})


router.use((err, req, res, next) => {
	console.error('Internal Error', err);

	res.status(500).send({ status: 500, msg: err.message });
});


module.exports = router;
