import React, { Component } from 'react';
import styles from './PlaylistMusics.module.css';

import PlaylistDescription from '../components/PlaylistDescription/PlaylistDescription.js';
import MusicList from '../components/Musics/MusicList.js';

import Loading from '../components/Loading.js';

class PlaylistMusics extends Component {
	constructor(props) {
		super(props);

		this.state = { 
			playlist: {},
			musics: [],
			loading: true
		}
	}

	wait = (miliseconds = 2000) => {
		return new Promise(resolve => {
			setTimeout(resolve, miliseconds);
		});
	}

	fetchPlaylist = () => {
		const { playlistId } = this.props.match.params;

		return fetch(`/playlist/${playlistId}`)
			.then(res => res.json())
			.then(playlist => {
				const { codplaylist, nome, dtnascimento, musics } = playlist;
				
				this.setState({
					playlist: { codplaylist, nome, dtnascimento },
					musics
				});
			})
			.catch(err => err);
	}

	deletePlaylist = (trackId) => {
		const { playlistId } = this.props.match.params;

		fetch(`/playlist/del-music/${playlistId}/${trackId}`, {
			method: 'DELETE'
		})
			.then(res => res.json())
			.then(() => this.fetchPlaylist())
			.catch(err => console.log(err));
	}

	componentDidMount() {
		this.fetchPlaylist()
			.then(() => this.wait(1000))
			.then(() => {
				this.setState({ loading: false })
			})
			.catch(err => console.log(err))
	}


	render() {
		const { playlist, musics, loading } = this.state;

		const playlistMusic = (
			<React.Fragment>
				<PlaylistDescription playlist={playlist} />
			</React.Fragment>	
		)

		const loadingComponent = <Loading />

		return (
			<section className={`${styles.playlistMusics} routes`}>
				{ (loading) ? loadingComponent : playlistMusic }
				{ (loading) ? null : <MusicList musics={musics} onDelete={this.deletePlaylist} /> }
			</section>
		);
	}
};

export default PlaylistMusics;
