import React, { Component } from 'react';
import styles from './PlaylistModal.module.css';

class PlaylistModal extends Component {
	constructor(props) {
		super(props);

		this.state = {
			playlists: []
		}
	}

	fetchPlaylist = () => {
		return fetch('/playlist')
			.then(res => res.json())
			.catch(err => err);
	}

	componentDidMount() {
		this.fetchPlaylist(`/playlist`)
			.then(playlists => this.setState({ playlists  }))
			.catch(err => console.log(err));
	}

	addInPlaylist(playlistId) {
		const musicId = this.props.musicId;

		fetch(`/playlist/add-music/${playlistId}/${musicId}`)
			.then(res => res.json())
			.then(() => this.props.closeModal())
			.catch(err => console.log(err))
	}

	playlistItems = () => {
		const { playlists } = this.state;

		return playlists.map(elem => {
			return (
				<li
					key={elem.codplaylist}
					onClick={() => this.addInPlaylist(elem.codplaylist)}
				>
					{elem.nome}
				</li>);
		});
		
	}

	render() {
		return (
			<section className={styles.playlistModal}>
				<section className={styles.playlistModalContent}>
					<h2>Escolha uma playlist</h2>
					<ul>
						{ this.playlistItems() }
					</ul>
					<button onClick={this.props.closeModal}>Cancelar</button>
				</section>
			</section>
		);
	}
}

export default PlaylistModal;

