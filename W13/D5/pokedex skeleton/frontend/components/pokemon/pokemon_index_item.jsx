import React from 'react';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = (pokemon) => {
  const path = `/pokemon/${pokemon.pokemon.id}`;
  return (
    <div>
      <Link to={path}>
        {pokemon.pokemon.name}
        <img src={pokemon.pokemon.image_url} />
      </Link>
    </div> )

}