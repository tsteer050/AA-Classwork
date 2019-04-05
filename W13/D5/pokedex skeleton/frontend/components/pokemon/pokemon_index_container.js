import { connect } from 'react-redux';
import { selectAllPokemon } from '../../reducers/selectors.js';
import PokemonIndex from './pokemon_index.jsx';

const mapStateToProps = (state) => {
  return {
    pokemon: selectAllPokemon(state)
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
  requestAllPokemon: () => dispatch(requestAllPokemon())
  };
};

const container = connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);


export default container;


