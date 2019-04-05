

export const fetchAllPokemon = () => {

  return $.ajax({
    url: '/api/pokemons',
    type: "GET"
  });
  
};

