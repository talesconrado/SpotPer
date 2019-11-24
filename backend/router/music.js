const express = require('express');
const db = require('../database');

const MusicModel = require('../model/music');

const router = express.Router();

const pool = db.pool(process.env);
const poolConnection = pool.connect();

const music = new MusicModel(pool);

router.get('/:albumId', (req, res, next) => {
	const albumId = req.params.albumId;

	if(!albumId) {
		res.status(400).json({ status: 400, msg: `You need to pass albumId params` });
	}

	poolConnection
		.then(() => music.getMusicByAlbum(albumId))
		.then(musics => {
			const data = musics.recordset;

			if (data.length > 0) {
				res.status(200).json(data);
			} else {
				res.status(404).json({ status: 404, msg: `Tracks within ${albumId} not found!` });
			}
		})
		.catch(err => next(err));
});

router.get('/composer/:composerName', (req, res, next) => {
	const composerName = req.params.composerName;

	if(!composerName) {
		res.status(400).json({ status: 400, msg: `You need to pass the composerName param` });
	}

	poolConnection
		.then(() => music.getMusicByComposerName(composerName))
		.then(musics => {
			const data = musics.recordset;

			if (data.length > 0) {
				res.status(200).json(data);
			} else {
				res.status(404).json({ status: 404, msg: `Couldn't find any tracks composed by ${composerName}.` });
			}
		})
		.catch(err => next(err));
});

router.get('/composition/:compositionType', (req, res, next) => {
    const compositionType = req.params.compositionType;

    if (!compositionType){
        req.status(400).json({ status: 400, msg: 'You need to pass the compositionType!'});
    }

    poolConnection
    .then(() => music.getMusicByCompositionType(compositionType))
    .then(musics => {
        const data = musics.recordset;

        if (data.length > 0) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ status: 404, msg: `Couldn't find any tracks of type ${compositionType}.` });
        }
    })
    .catch(err => next(err));

});

router.get('/record/:recordType', (req, res, next) => {
    const recordType = req.params.recordType;

    if (!recordType){
        req.status(400).json({ status: 400, msg: 'You need to pass the recordType!'});
    }

    poolConnection
    .then(() => music.getMusicByRecordType(recordType))
    .then(musics => {
        const data = musics.recordset;

        if (data.length > 0) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ status: 404, msg: `Couldn't find any tracks of type ${recordType}.` });
        }
    })
    .catch(err => next(err));

});

router.get('/label/:labelName', (req, res, next) => {
    const labelName = req.params.labelName;

    if (!labelName){
        req.status(400).json({ status: 400, msg: 'You need to pass the labelName!'});
    }

    poolConnection
    .then(() => music.getMusicByRecorderCompany(labelName))
    .then(musics => {
        const data = musics.recordset;

        if (data.length > 0) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ status: 404, msg: `Couldn't find any tracks from the label ${labelName}.` });
        }
    })
    .catch(err => next(err));

});


module.exports = router;