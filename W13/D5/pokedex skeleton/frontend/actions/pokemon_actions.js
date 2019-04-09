export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';
export const RECEIVE_NEW_POKEMON = 'RECEIVE_NEW_POKEMON';
export const START_SPINNER = 'START_SPINNER';
export const STOP_SPINNER = 'STOP_SPINNER';
import * as APIUtil from '../util/api_util.js';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon: pokemon
});

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const receivePokemon = pokemon => ({
  type: RECEIVE_POKEMON,
  pokemon: pokemon
})

export const receiveNewPokemon = pokemon => ({
  type: RECEIVE_NEW_POKEMON,
  pokemon: pokemon
})

export const requestPokemon = (id) => (dispatch) => (
  APIUtil.fetchPokemon(id)
    .then(pokemon => { dispatch(receivePokemon(pokemon));
    return pokemon;
    })
);

export const createPokemon = (pokemon) => (dispatch) => (
  APIUtil.createPokemon(pokemon)
    .then(pokemon => { dispatch(receiveNewPokemon(pokemon));
    return pokemon;
    })
);


export const loading = () => ({
  type: START_SPINNER
})

export const stopLoading = () => ({
  type: STOP_SPINNER
})

