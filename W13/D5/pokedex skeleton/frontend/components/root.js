import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container.js';
import { HashRouter, Route } from 'react-router-dom';
import { PokemonIndexItem } from './pokemon/pokemon_index_item.jsx';
import PokemonForm from './pokemon/pokemon_form.jsx';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <Route path="/create" component={PokemonForm} />
      <Route path="/" component={PokemonIndexContainer} />
      
    </HashRouter>
  </Provider>
);

export default Root;