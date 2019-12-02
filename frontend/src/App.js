import React from 'react';
import './App.css';

import {
	BrowserRouter as Router,
	Switch,
	Route,
	Redirect
} from 'react-router-dom';

import SideBar from './components/SideBar.js';
import Playlists from './router/Playlists.js';
import PlaylistMusics from './router/PlaylistMusics.js';
import AlbumList from './router/AlbumList';
import AlbumMusics from './router/AlbumMusics.js';

function App() {
  return (
		<Router>
			<SideBar />
			<Switch>
				<Route exact path="/">
					<Redirect to="/playlist" />
				</Route>

				<Route path="/playlist/:playlistId" component={PlaylistMusics}>
				</Route>

				<Route path="/playlist">
					<Playlists />
				</Route>

				<Route path="/album/:albumId" component={AlbumMusics}>
				</Route>

				<Route path="/album">
					<AlbumList />
				</Route>
			</Switch>
		</Router>
  );
}

export default App;
