import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON, RECEIVE_NEW_POKEMON } from './../actions/pokemon_actions.js';
import { merge } from 'lodash';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  let pokemon;
  // debugger;
  switch(action.type) {
    case (RECEIVE_ALL_POKEMON):
      pokemon = action.pokemon;
      return merge({}, state, pokemon);
    case (RECEIVE_POKEMON):
      pokemon = action.pokemon.pokemon;
      return merge({}, state, { [pokemon.id]: pokemon });
    case (RECEIVE_NEW_POKEMON):
      pokemon = action.pokemon;
      return merge({}, state, pokemon)
    default: 
      return state;
  }
};



export default pokemonReducer;