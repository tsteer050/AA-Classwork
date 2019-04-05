import { RECEIVE_ALL_POKEMON } from './../actions/pokemon_actions.js';
import { merge } from 'lodash';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case (RECEIVE_ALL_POKEMON):
      const pokemon = action.pokemon;
      return merge({}, state, pokemon);
    default: 
      return state;
  }
};

export default pokemonReducer;