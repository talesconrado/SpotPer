import React, { Component } from 'react';
import styles from './SideBar.module.css';

import { NavLink } from 'react-router-dom'

import logo from '../assets/logo.svg'; 

class SideBar extends Component {
	render() {
		return (
			<nav className={styles.navbar}>
				<img src={logo} alt="Spotper Logo" />
				<ul>
					<li><NavLink exact activeClassName={styles.selected} to="/">Playlists</NavLink></li>
					<li><NavLink exact activeClassName={styles.selected} to="/album">Album</NavLink></li>
					<li><NavLink exact activeClassName={styles.selected} to="/compositores">Compositores</NavLink></li>
					<li><NavLink exact activeClassName={styles.selected} to="/estilos">Estilos</NavLink></li>
				</ul>
			</nav>
		);
	}
};


export default SideBar;
