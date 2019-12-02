import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import coverList from './AlbumCovers';
import styles from './AlbumItem.module.css';

class AlbumItem extends Component {

	render() {
		return (
			<li className={styles.albumItem}>
				
				<Link to={`album/${this.props.elem.codalbum}`}>
					<img src={coverList[this.props.elem.codalbum]} alt="CoverArt" />
					<h2>{this.props.elem.descricao}</h2>
				</Link>
					<section></section>
			</li>
		);
	}
};

AlbumItem.propTypes = {
	elem: PropTypes.shape({
		codalbum: PropTypes.number.isRequired,
		descricao: PropTypes.string.isRequired,
	})
};

export default AlbumItem;
