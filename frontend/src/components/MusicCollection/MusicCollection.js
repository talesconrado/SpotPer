import React, { Component } from 'react';
import styles from './MusicCollection.module.css';

import MusicItem from './MusicItem.js';

class MusicCollection extends Component {
	musicItems = () => {
		return this.props.musics
			.map(elem => <MusicItem key={elem.codfaixa} music={elem}  />);
	}

	render() {
		return (
			<ul className={styles.musicCollection}>
				{this.musicItems()}
			</ul>
		);
	}
}

export default MusicCollection;
