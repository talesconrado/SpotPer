import React, { Component } from 'react';
import PropTypes from 'prop-types';

import AlbumItem from './AlbumItem';
import styles from './AlbumCollection.module.css';

class AlbumCollection extends Component {
	createItems(list) {
		return list
			.map(elem => <AlbumItem key={elem.codalbum} elem={elem}/>);
	}

	render() {
		const items = this.props.list;

		return (
			<ul className={styles.albumCollection}>
				{this.createItems(items)}
			</ul>
		);
	}
}

AlbumCollection.propTypes = {
	list: PropTypes.arrayOf(PropTypes.shape({
		codalbum: PropTypes.number.isRequired,
		descricao: PropTypes.string.isRequired
	}))
};

export default AlbumCollection;
