import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item.jsx';
import { Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container.js';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);

  }

  componentDidMount() {
    this.props.requestAllPokemon();

  }

  render() {
    
    const pokemonItems = this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />);
    return (
      <div>
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        <ul> 
          {pokemonItems}
        </ul> 
      </div>
    )
  }
}

export default PokemonIndex;