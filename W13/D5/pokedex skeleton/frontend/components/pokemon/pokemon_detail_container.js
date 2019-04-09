import { connect } from 'react-redux';

import PokemonDetail from './pokemon_detail';
import { requestPokemon } from '../../actions/pokemon_actions';
import { selectPokeItems } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
 
  const pokemon = state.entities.pokemon[ownProps.match.params.pokemonId];
  // debugger;
  return {
    pokemon: pokemon,
    items: selectPokeItems(state, pokemon)
  };
};

const mapDispatchToProps = dispatch => ({
  requestPokemon: id => dispatch(requestPokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
