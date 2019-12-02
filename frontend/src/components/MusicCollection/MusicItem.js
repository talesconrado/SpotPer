import React, { Component } from 'react';
import styles from './MusicItem.module.css';

import PlaylistModal from '../PlaylistModal.js';

class MusicItem extends Component {
	constructor(props) {
		super(props);

		this.state = {
			modal: false,
		}
	}

	closeModal = () => {
		this.setState({ modal: false });
	}

	openModal = () => {
		this.setState({ modal: true });
	}

	render() {
		const { music } = this.props
		const regex = /\d*:\d*\./g;

		const musicTime = music.tempo
			.match(regex)[0]
			.replace('.', '');

		let modalComponent;
		if (this.state.modal) {
			modalComponent = <PlaylistModal musicId={music.codfaixa} closeModal={this.closeModal} />
		} else {
			modalComponent = null;
		}

		return (
			<li className={styles.musicItem}>
				<p className={styles.musicNumber}>{ music.numfaixa }</p>
				<p className={styles.musicName}>{ music.descricao  }</p>
				<p className={styles.musicTime}>{ musicTime }</p>
				<button className={styles.musicBtn} onClick={this.openModal}></button>

				{ modalComponent }
			</li>
		);
	}
}

export default MusicItem;
