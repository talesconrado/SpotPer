import React, { Component } from 'react';
import {useParams} from 'react-router-dom';

import Loading from '../components/Loading.js';

class Album extends Component{
    constructor(props){
        super(props);
        
        this.state = {
            tracks: [],
            loading: true
        }
    }

    componentDidMount() {
		this.fetchTracks()
			.then(tracks => {
				return this.wait(1000).then(() => tracks);
			})
			.then(tracks => {
				this.setState({ tracks, loading: false });
			})
			.catch(err => console.log(err));
    }
    
    wait = (milisecond) => {
		return new Promise(resolve => {
			setTimeout(resolve, milisecond);
		});
    }
    
    fetchTracks = async () => {
        let { id } = useParams();
		return fetch(`/music/${id}`)
			.then(res => res.json())
			.catch(err => err);
    }
    
    render() {
		const { musics } = this.state;

		const musicComponent = (
			<div className={styles.albumList}>
				<h1>Albuns</h1>
				<MusicCollection list={musics}/>
			</div>
		);

		const loadingComponent = <Loading />
		return (this.state.loading) ? loadingComponent : musicComponent;
	}

};

export default AlbumList;
