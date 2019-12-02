import React, { Component } from 'react';
import styles from './AlbumMusics.module.css';

import AlbumDescription from '../components/AlbumDescription/AlbumDescription.js';
import AlbumCollection from '../components/MusicCollection/MusicCollection.js';
import Loading from '../components/Loading.js';


export class AlbumMusics extends Component {
	constructor(props) {
		super(props);

		this.state = {
			musics: [],
			album: {},
			loading: true,
		}
	}

	fetchMusics = (albumId) => {
		return fetch(`/music/${albumId}`)
			.then(res => res.json())
			.catch(err => err);
	}

	fetchAlbum = (albumId) => {
		return fetch(`/album/id/${albumId}`)
			.then(res => res.json())
			.catch(err => err);
	}

	wait = (miliseconds) => {
		return new Promise(resolve => {
			setTimeout(resolve, miliseconds);
		})
	}

	componentDidMount() {
		const { albumId } = this.props.match.params;

		this.fetchMusics(albumId)
			.then(musics => this.setState({ musics }))
			.then(() => this.fetchAlbum(albumId))
			.then(album => this.wait(1000).then(() => album))
			.then(album => this.setState({ album, loading: false }))
			.catch(err => console.log(err));
	}

	render() {
		const { loading, album, musics } = this.state;

		const component = (
			<section className={`${styles.albumMusics} routes`}>
				<AlbumDescription album={album} />
				<AlbumCollection musics={musics} />
			</section>
		);

		return (loading) ? <Loading /> : component;
	}
}

export default AlbumMusics;
