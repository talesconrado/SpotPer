import React, { Component } from 'react';

import styles from './MusicList.module.css';

import MusicItem from './MusicItem.js';

class MusicList extends Component {

	

	render() {
		const { musics, onDelete } = this.props
			
		const musicItems = musics
			.map(elem => <MusicItem music={elem} key={elem.codfaixa} onDelete={onDelete} />);

		return (
			<ul className={styles.musicList}>
				{ musicItems }
			</ul>
		);
	}
}

export default MusicList;

