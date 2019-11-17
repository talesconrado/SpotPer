const sql = require('mssql');

exports.pool = function (envVar) {
	const config = {
		user: envVar.DB_USER,
		password: envVar.DB_PSW,
		server: (envVar.NODE_ENV === 'development') ? envVar.DB_DEV : envVar.DB_PROD,
		database: envVar.DB,
		pool: {
			max: 8,
			min: 0,
		}
	}

	const pool = new sql.ConnectionPool(config);

	return pool
}



