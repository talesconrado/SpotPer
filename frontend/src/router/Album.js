import React, { Component } from 'react';

import MusicList from '../components/Musics/MusicList.js';
import Loading from '../components/Loading.js';

class Album extends Component {
	constructor(props) {
		super(props);

		this.state = { 
			album: {},
			musics: [],
			loading: true
		}
    }
    wait = (miliseconds = 2000) => {
		return new Promise(resolve => {
			setTimeout(resolve, miliseconds);
		});
    }
    fetchAlbum = () => {
		const { albumId } = this.props.match.params;

		return fetch(`/musics/${albumId}`)
			.then(res => res.json())
			.then(album => {
				const { descricao, numfaixa } = playlist;
				
				this.setState({
					playlist: { codplaylist, nome, dtnascimento },
					musics
				});
			})
			.catch(err => err);
	}
}