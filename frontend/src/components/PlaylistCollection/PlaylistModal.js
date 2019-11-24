import React, { Component } from 'react';
import styles from './PlaylistModal.module.css';

class PlaylistModal extends Component {
	handleCancel = (e) => {
		this.props.close();
	}

	handleCreate = (e) => {
		const input =	e.target.parentNode.previousSibling.value;

		if(input !== '') {
			fetch(`/playlist/add-playlist/${input}`)
				.then(res => res.json())
				.then(res => {
					this.props.close();
				});
		}
	}

	render() {
		return (
			<section className={styles.modalShadow}>
				<section className={styles.modalContent}>
					<section className={styles.modalHeader}>
						<h2>Criar Playlist</h2>
					</section>

					<section className={styles.modalBody}>
						<input type="text" placeholder="Playlist name"/>

						<section className={styles.modalBtns}>
							<button onClick={this.handleCancel}>Cancelar</button>
							<button onClick={this.handleCreate}>Criar</button>
						</section>
					</section>
				</section>
			</section>
		);
	}
}

export default PlaylistModal;
