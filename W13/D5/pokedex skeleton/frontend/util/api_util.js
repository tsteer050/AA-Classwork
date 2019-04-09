

export const fetchAllPokemon = () => {

  return $.ajax({
    url: '/api/pokemons',
    type: "GET"
  });
  
};

export const fetchPokemon = (id) => {

  return $.ajax({
    url: `/api/pokemons/${id}`,
    type: "GET"
  });

};

export const createPokemon = (data) => {

  return $.ajax({
    url: '/api/pokemons',
    type: "POST",
    data: data
  });

};



// $.ajax({
//   url: '/api/pokemons',
//   type: "POST",
//   data: {
//     'pokemon': {
//       'name': 'Jesse',
//       'attack': 1303,
//       'defense': 1200,
//       'poke_type': 'ground',
//       'moves': [
//         'cool beans',
//         'hard reset',
//         'i hate spiders'
//       ],
//       'image_url': '/url'
//     }
//   }
// });