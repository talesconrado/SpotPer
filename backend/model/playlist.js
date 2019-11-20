class Playlist {
	constructor(pool) {
		this.pool = pool;
		this.request = pool.request();
		pool.on('error', err => {
			console.error('SQL Error', err);
		});
	}

	createPlaylist(playlistName) {
		const result = this.request.query(`INSERT INTO playlist VALUES (NEWID(), ${playlistname}, CURRENT_TIMESTAMP)`);

		return result;
	}

	getPlaylists() {
		const result = this.request.query(`SELECT * FROM playlist`);

		return result;
	}

	getPlaylistById(playlistId) {
		const result = this.request.query(`SELECT * WHERE codplaylist = ${playlistId}`);

		return result;
	}

	getPlaylistMusics(playlistId) {
		const result = this.request.query(`SELECT codfaixa, f.descricao, tempo, a.codalbum, tc.cod, a.descricao, tc.descricao FROM playlist p, faixasNaPlaylist fnp, faixa f, album a, tipoComposicao tc WHERE p.codplaylist = fnp.codplaylist AND fnp.codfaixaplaylist = f.codfaixa AND f.codalbum = a.codalbum AND f.codtipocomposicao = tc.cod;`);

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
		const result = this.request.query(`INSERT INTO faixasNaPlaylist VALUES(${playlistId}, ${musicId})`);

		return result;
	}
}

module.exports = Playlist;
