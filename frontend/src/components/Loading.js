import React from 'react';
import styles from './Loading.module.css';

import disc from '../assets/disc.svg';

function Loading(props) {
	return (
		<section className={styles.loading}>
			<img src={disc} alt="Disc loading" />
			<h2>Carregando</h2>
		</section>
	)
};

export default Loading;
