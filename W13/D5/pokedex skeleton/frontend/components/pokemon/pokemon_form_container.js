import { connect } from 'react-redux';

import { createPokemon } from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form.jsx';


const mapDispatchToProps = dispatch => ({
  createPokemon: (pokemon) => dispatch(createPokemon(pokemon))
});

export default connect(
  mapDispatchToProps
)(PokemonForm);
