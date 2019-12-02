import React, { Component } from 'react';
import styles from './AlbumDescription.module.css';

import disc from '../../assets/disc.svg';

class AlbumDescription extends Component {
	render() {
		const { album } = this.props;

		const regex = /\d*-\d*-\d*/g

		const recordDate = album.dtgravacao
			.match(regex)[0];

		const buyDate = album.dtcompra
			.match(regex)[0];

		const buyType = (album.tipocompra === 'Download') ? 'Online' : 'Fisicamente';

		return (
			<section className={styles.albumDescription}>
				<section className={styles.albumDescImg}>
					<img src={disc} alt="Disco" />
				</section>
				<section className={styles.albumDescContent}>
					<h2>{ album.descricao }</h2>
					<p>Gravado em { recordDate }</p>
					<p>Comprado em { buyDate }</p>
					<p>Esse album foi adquirido {buyType} por {album.prcompra}</p>
				</section>
			</section>
		);
	}
}

export default AlbumDescription
