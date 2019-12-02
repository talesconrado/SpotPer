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
			const data = playlists.recordset

			if (data.length > 1) {
				res.status(200).json(data);
			} else if (data.length > 0) {
				res.status(200).json(data[0]);
			} else {
				res.status(404).json({ status: 404, msg: `There is not playlist` });
			}
		})
		.catch(err => next(err));
});

router.get('/:playlistId', (req, res, next) => {
	const { playlistId } = req.params;
	
	poolConnection
		.then(() => playlist.getPlaylistById(playlistId))
		.then(data => data.recordset[0])
		.then(playlistData => playlist.getPlaylistWithMusics(playlistData))
		.then(result => {
			if (!result) {
				res.status(404).json({ status: 404, msg: `There is no musics or playlist` });
			} else {
				res.status(200).json(result);
			}
		})
		.catch(err => next(err));
});

router.get('/add-playlist/:playlistName', (req, res, next) => {
	const name = req.params.playlistName;

	poolConnection
		.then(() => playlist.createPlaylist(name))
		.then(playlist => {
			console.log(playlist);

			res.status(200).send({ status: 200, msg: `Playlist ${name} created` });
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

	if (!playlistId || !musicId) {
		res.status(400).json({ status: 400, msg: 'You need pass a playlistId or musicId params' });
	}

	poolConnection
		.then(() => playlist.deleteMusicOfPlaylist(playlistId, musicId))
		.then(() => res.status(200).json({ status: 200, msg: `music deleted from playlist with id ${playlistId}` }))
		.catch(err => next(err));
});

router.get('/add-music/:playlistId/:musicId', (req, res, next) => {
	const { playlistId, musicId } = req.params;

	if (!playlistId || !musicId) {
		res.status(400).json({ status: 400, msg: 'You need pass a playlistId or musicId params' });
	}

	poolConnection
		.then(() => playlist.addMusicInPlaylist(playlistId, musicId))
		.then(() => res.status(200).json({ status: 200, msg: `music ${musicId} added in playlist ${playlistId}` }))
		.catch(err => next(err));
});

router.use((err, req, res, next) => {
	console.error('Internal Error', err);

	res.status(500).send({ status: 500, msg: err.message });
});


module.exports = router;
