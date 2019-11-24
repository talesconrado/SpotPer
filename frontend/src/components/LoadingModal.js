import React from 'react';
import styles from './LoadingModal.module.css';

import disc from '../assets/disc.svg';

function LoadingModal(props) {
	return (
		<section className={styles.modalLoading}>
			<section className={styles.modalLoadingContent}>
				<img src={disc} alt="Disc loading" />
				<h2>Carregando</h2>
			</section>
		</section>
	)
};

export default LoadingModal;
