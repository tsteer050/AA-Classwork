import { merge } from 'lodash';
import { RECEIVE_POKEMON } from './../actions/pokemon_actions.js';


const itemsReducer = ( state = {}, action ) => {
  Object.freeze(state);

  let items;

  switch(action.type) {
    case (RECEIVE_POKEMON):
    
      items = action.pokemon.items;
      console.log(items);
      return merge({}, state, items);
    default:
      return state;  
  }
}

export default itemsReducer;