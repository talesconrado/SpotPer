import React, { Component } from 'react';
import PropTypes from 'prop-types';

import styles from './PlaylistCollection.module.css';

import PlaylistItem from './PlaylistItem.js';

class PlaylistCollection extends Component {
	createItems(list) {
		const onDelete = this.props.onDelete;

		return list
			.map(elem => <PlaylistItem key={elem.codplaylist} elem={elem} onDelete={onDelete}/>);
	}

	render() {
		const items = this.props.list;

		return (
			<ul className={styles.playlistCollection}>
				{this.createItems(items)}
			</ul>
		);
	}
}

PlaylistCollection.propTypes = {
	list: PropTypes.arrayOf(PropTypes.shape({
		codplaylist: PropTypes.number.isRequired,
		nome: PropTypes.string.isRequired
	}))
};

export default PlaylistCollection;
