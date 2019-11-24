import React, { Component } from 'react';


class Playlists extends Component {
	componentDidMount() {
		const headers = new Headers();

		fetch('localhost:8080/playlist', { method: 'GET', mode: 'cors', headers })
			.then(res => res.json())
			.then(res => console.log(res))
			.catch(err => console.log(err));
	}


	render() {
		return (
			<section className="routes">
				<h1>Playlists</h1>
			</section>
		);
	}
};

export default Playlists;
