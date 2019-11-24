import React, { Component } from 'react';

import styles from './Playlists.module.css'

import PlaylistCollection from '../components/PlaylistCollection/PlaylistCollection.js';
import Loading from '../components/Loading.js';
import PlaylistModal from '../components/PlaylistCollection/PlaylistModal.js';

class Playlists extends Component {
	constructor(props) {
		super(props);

		this.state = {
			playlists: [],
			loading: false,
			modal: false
		}
	}

	componentDidMount() {
		this.fetchPlaylist()
			.then(playlists => {
				this.setState({ playlists })
			})
			.catch(err => console.log(err));
	}

	fetchPlaylist = () => {
		return fetch('/playlist')
			.then(res => res.json())
			.catch(err => err);
	}

	showModal = () => {
		this.setState({ modal: true });
	}

	closeModal = () => {
		this.fetchPlaylist()
			.then(playlists => {
				this.setState({ playlists, modal: false });
			})
			.catch(err => console.log(err));
	}

	deletePlaylist = (id) => {
		fetch(`/playlist/del-playlist/${id}`, { method: 'DELETE' })
			.then(() => this.fetchPlaylist())
			.then(playlists => {
				this.setState({ playlists })
			})
			.catch(err => console.log(err));
	}

	render() {
		const { playlists, modal } = this.state;

		const modalComponent = (modal) ? <PlaylistModal close={this.closeModal} /> : null;

		const playlistComponent = (
			<section className={`routes ${styles.playlists}`}>
				<h1>Playlists</h1>
				<button className={styles.playlistBtn} onClick={this.showModal}>Criar Playlist</button>
				{ modalComponent }
				<PlaylistCollection list={playlists} onDelete={this.deletePlaylist}/>
			</section>
		);

		const loadingComponent = <Loading />
		return (this.state.loading) ? loadingComponent : playlistComponent;
	}
};

export default Playlists;
