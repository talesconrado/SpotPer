class Music {
	constructor(pool) {
		this.pool = pool;
		this.request = pool.request();

		this.pool.on('err', err => {
			console.error('Pool Error', err);
		});
	}

	getMusicByAlbum(albumId) {
		const result = this.request.query(`SELECT * FROM faixa WHERE codalbum = ${albumId}`);
		
		return result;
	}

	getMusicByComposerName(composerName) {
		const result = this.request.query(`SELECT f.codfaixa, f.descricao, f.tipogravacao, f.tempo, c.nome AS 'compositor' FROM faixa f, compositor c, compostaPor WHERE f.codfaixa = compostaPor.codfaixacompositor AND c.codcompositor = compostaPor.codcompositor AND c.nome LIKE '%${composerName}%'`);
	
		return result;
	}

	getMusicByCompositionType(compositionType) {
		const result = this.request.query(`SELECT f.codfaixa, f.descricao, f.tipogravacao, f.tempo, c.nome, tc.descricao FROM faixa f, tipoComposicao tc, compositor c, compostaPor WHERE f.codtipocomposicao = tc.cod AND tc.descricao LIKE '%${compositionType}%' AND f.codfaixa = compostaPor.codfaixacompositor AND c.codcompositor = compostaPor.codcompositor`);

		return result;
	}

	getMusicByRecordType(recordType) {
		const result = this.request.query(`SELECT codfaixa, descricao, tipogravacao, tempo, codalbum FROM faixa WHERE tipogravacao = '${recordType}'`);

		return result;
	}

	getMusicByRecorderCompany(recorderCompanyName) {
		const result = this.request.query(`SELECT f.codfaixa, f.descricao, f.tipogravacao, f.tempo, a.descricao AS 'album', g.nome AS 'gravadora' FROM faixa f, album a, gravadora g WHERE f.codalbum = a.codalbum AND a.codgravadora = g.codgravadora AND g.nome LIKE '%${recorderCompanyName}%'`);

		return result;
	}
}

module.exports = Music;
