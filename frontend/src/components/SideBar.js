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
					<li><NavLink exact activeClassName={styles.selected} to="/playlist">Playlists</NavLink></li>
					<li><NavLink exact activeClassName={styles.selected} to="/album">Album</NavLink></li>
				</ul>
			</nav>
		);
	}
};


export default SideBar;
