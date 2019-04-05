import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_util.js';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions.js';
import pokemonReducer from './reducers/pokemon_reducer.js';
import { configureStore } from './store/store.js';
import Root from './components/root.js';

window.fetchAllPokemon = fetchAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.pokemonReducer = pokemonReducer;
const store = configureStore();
window.getState = store.getState;
window.dispatch = store.dispatch;


document.addEventListener("DOMContentLoaded", () => {

  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
  
});

