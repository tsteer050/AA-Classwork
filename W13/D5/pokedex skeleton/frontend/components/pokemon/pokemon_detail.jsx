import React from 'react';
import { Route, Link } from 'react-router-dom';
import ItemDetailContainer from './item_detail_container.js';

class PokemonDetail extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {

    let path;
    return (
      <div>
        <h1>{this.props.pokemon.name}</h1>
        <ul>
          <li>Type: {this.props.pokemon.poke_type}</li>
          <li>Attack: {this.props.pokemon.attack}</li>
          <li>Defense: {this.props.pokemon.defense}</li>
          <li>Moves: {this.props.pokemon.moves} </li>
          <li> Items:  <ul>
            {this.props.items.map((item, idx) => <Link key={idx} to={`/pokemon/${this.props.pokemon.id}/item/${item.id}`}> <li >{item.name}</li  ></Link> ) }
              
            </ul>
           </li> 
        </ul>
          <div>
          <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer}/>
          </div>
      </div>

      

    );
  }

  componentDidUpdate(prevProps) {
    if (prevProps.pokemon.id !== this.props.pokemon.id) {
      this.props.requestPokemon(this.props.match.params.pokemonId);
    }
  }

  componentDidMount() {
    // debugger;
    this.props.requestPokemon(this.props.match.params.pokemonId);
  }

}

export default PokemonDetail;