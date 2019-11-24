import React, { Component } from 'react';

import styles from './PlaylistDescription.module.css';

import disc from '../../assets/disc.svg';

class PlaylistDescription extends Component {
	render() {
		const { playlist } = this.props;

		const regExp = /(?:\d*[-|:]\d*[-|:]\d*)/g

		const dateStr = playlist.dtnascimento
			.match(regExp)
			.map(elem => elem.replace(/-/g, '/'))
			.join(' - ');



		return (
			<section className={styles.description}>
				<section className={styles.descriptionImg}>
					<img src={disc} alt="Disc"/>
				</section>

				<section className={styles.descriptionContent}>
					<h2>{ playlist.nome }</h2>
					<p>Criado em: { dateStr }</p>
				</section>
			</section>
		);
	}
}

export default PlaylistDescription;
