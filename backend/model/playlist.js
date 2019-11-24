class Playlist {
	constructor(pool) {
		this.pool = pool;
		this.request = pool.request();
		pool.on('error', err => {
			console.error('SQL Error', err);
		});
	}

	createPlaylist(playlistName) {
		const result = this.request.query(`INSERT INTO playlist VALUES('${playlistName}', CURRENT_TIMESTAMP)`);

		return result;
	}

	getPlaylists() {
		const result = this.request.query(`SELECT * FROM playlist`);

		return result;
	}

	getPlaylistWithMusics(playlists) {
		const data = playlists.recordset;

		const promises = data.map(elem => this.getPlaylistMusics(elem.codplaylist));

		return Promise.all(promises)
			.then(res => res.map(elem => elem.recordset))
			.then(musics => {
				return data.map((elem, ind) => {
					const copy = Object.assign({}, elem, { musics: [...musics[ind]] })

					return copy
				});

			})
			.catch(err => err);
	}

	getPlaylistById(playlistId) {
		const result = this.request.query(`SELECT * WHERE codplaylist = ${playlistId}`);

		return result;
	}

	getPlaylistMusics(playlistId) {
			const result = this.request.query(`SELECT f.codfaixa, f.descricao AS 'musica', f.tipogravacao, f.tempo, f.codalbum, c.codcompositor, c.nome AS 'compositor', tc.descricao AS 'periodoMusical' FROM playlist pl, faixasNaPlaylist fnp, faixa f, compostaPor cp, compositor c, tipoComposicao tc WHERE pl.codplaylist = fnp.codplaylist AND fnp.codfaixaplaylist = f.codfaixa AND f.codfaixa = cp.codfaixacompositor AND cp.codcompositor = c.codcompositor AND f.codtipocomposicao = tc.cod AND pl.codplaylist = '${playlistId}'`)

			return result;
	}

	deletePlaylist(playlistId) {
		const result = this.request.query(`DELETE FROM playlist WHERE codplaylist = '${playlistId}'`);

		return result;
	}

	deleteMusicOfPlaylist(playlistId, musicId) {
		const result = this.request.query(`DELETE FROM faixasNaPlaylist WHERE codplaylist = '${playlistId}' AND codfaixaplaylist = ${musicId}`);

		return result;
	}

	updatePlaylistName(playlistId, newName) {
		const result = this.request.query(`UPDATE playlist SET nome = ${newName} WHERE codplaylisst = ${playlistId}`);

		return result;
	}

	addMusicInPlaylist(playlistId, musicId) {
		const result = this.request.query(`INSERT INTO faixasNaPlaylist VALUES('${playlistId}', ${musicId})`);

		return result;
	}
}

module.exports = Playlist;
