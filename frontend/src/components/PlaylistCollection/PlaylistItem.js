import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

import itemStyles from './PlaylistItem.module.css';
import disc from '../../assets/disc.svg';

class PlaylistItem extends Component {

	handleDelete = (e) => {
		this.props.onDelete(this.props.elem.codplaylist);
	}

	render() {
		return (
			<li className={itemStyles.playlistItem}>
				<img src={disc} alt="Disc" />
				<Link to={`playlist/${this.props.elem.codplaylist}`}>
					<h2>{this.props.elem.nome}</h2>
				</Link>
				<section onClick={this.handleDelete} className={itemStyles.playlistDel}>
					<section></section>
				</section>
			</li>
		);
	}
};

PlaylistItem.propTypes = {
	elem: PropTypes.shape({
		codplaylist: PropTypes.number.isRequired,
		nome: PropTypes.string.isRequired,
	})
};

export default PlaylistItem;
