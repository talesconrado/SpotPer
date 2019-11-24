import React, { Component } from 'react';
import styles from './MusicItem.module.css';

import { Link } from 'react-router-dom';

class MusicItem extends Component {
	handleDelete = (e) => {
		this.props.onDelete(this.props.music.codfaixa);
	}

	render() {
		const { music } = this.props;
		const timeStr = music.tempo
			.match(/:\d*/g)
			.join('')
			.replace(/:/, '');

		return (
			<li className={styles.musicItem}>
				<button className={styles.play}></button>
				<section className={styles.musicInfos}>
					<h2>{ music.musica }</h2>
					<p className={styles.musicExtraInfos}>
						<Link to='#'>{ music.compositor }</Link>
						 - <Link to='#'>interprete</Link>
						 - <Link to="#"> Album </Link>
					</p>
				</section>
				<p className={styles.musicTime}>{timeStr}</p>
				<button className={styles.deleteBtn} onClick={this.handleDelete}>
					<section></section>
				</button>
			</li>
		)
	}
};

export default MusicItem;
