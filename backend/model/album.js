class Album {
	constructor(pool) {
		this.pool = pool;
		this.request = pool.request();

		this.pool.on('error', err => {
			console.error('Pool Error', err);
		});
	}

	getAlbums() {
		const result = this.request.query('SELECT * FROM album');

		return result;
	}

	getAlbumById(id) {
		const result = this.request.query(`SELECT * FROM album WHERE codalbum = ${id}`);

		return result;
	}

	getAlbumByName(albumName) {
		const result = this.request.query(`SELECT * FROM album WHERE descricao = ${albumName}`);

		return result;
	}

	getAlbumByPrice(albumPrice) {
		const result = this.request.query(`SELECT * FROM album WHERE prcompra = ${albumPrice}`);

		return result;
	}

	getAlbumBiggerThan(albumPrice) {
		const result = this.request.query(`SELECT * FROM album WHERE prcompra >= ${albumPrice}`);

		return result;
	}

	getAlbumLessThan(albumPrice) {
		const result = this.request.query(`SELECT * FROM album WHERE prcompra <= ${albumPrice}`);

		return result
	}
}

module.exports = Album;
