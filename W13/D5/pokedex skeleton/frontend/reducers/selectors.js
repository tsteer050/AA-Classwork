

export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon);
};

export const selectPokeItems = (state, poke) => {
  if ( poke.item_ids ) {
    return poke ? poke.item_ids.map(id => state.entities.items[id]) : [];
  }
  return [];
};

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId];
}