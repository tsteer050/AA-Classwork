import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_util.js';
import { receiveAllPokemon, requestAllPokemon, receivePokemon } from './actions/pokemon_actions.js';
import pokemonReducer from './reducers/pokemon_reducer.js';
import { configureStore } from './store/store.js';
import Root from './components/root.js';
import { HashRouter, Route } from 'react-router-dom';

const store = configureStore();


document.addEventListener("DOMContentLoaded", () => {

  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);

  window.receivePokemon = receivePokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  
});

