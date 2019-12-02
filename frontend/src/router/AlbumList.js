import React, { Component } from 'react';

import Loading from '../components/Loading.js';
import AlbumCollection from '../components/AlbumCollection/AlbumCollection';
import styles from './AlbumList.module.css';

class AlbumList extends Component{
    constructor(props) {
        super(props);

        this.state = {
            albums: [],
            loading: true
        }
    }

    componentDidMount() {
			this.fetchAlbums()
				.then(albums => {
					return this.wait(1000).then(() => albums);
				})
				.then(albums => {
					this.setState({ albums, loading: false });
				})
				.catch(err => console.log(err));
    }

    wait = (milisecond) => {
			return new Promise(resolve => {
				setTimeout(resolve, milisecond);
			});
    }

    fetchAlbums = async () => {
			return fetch('/album')
				.then(res => res.json())
				.catch(err => err);
    }
 
    render() {
			const { albums } = this.state;

			const albumComponent = (
				<div className={`${styles.albumList} routes`}>
					<h1>Albuns</h1>
					<AlbumCollection list={albums}/>
				</div>
			);

			const loadingComponent = <Loading />
			return (this.state.loading) ? loadingComponent : albumComponent;
	}

};

export default AlbumList;
