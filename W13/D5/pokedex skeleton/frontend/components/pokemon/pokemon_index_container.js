import { connect } from 'react-redux';
import { selectAllPokemon,  } from '../../reducers/selectors.js';
import PokemonIndex from './pokemon_index.jsx';
import { requestAllPokemon } from './../../actions/pokemon_actions.js';

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


