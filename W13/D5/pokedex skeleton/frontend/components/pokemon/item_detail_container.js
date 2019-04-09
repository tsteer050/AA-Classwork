import { connect } from 'react-redux';
import { selectPokemonItem, } from '../../reducers/selectors.js';
import { ItemDetail } from './item_detail.jsx';

const mapStateToProps = (state, ownProps) => {
  
  const item = selectPokemonItem(state, ownProps.match.params.itemId);
  return {
    item
  };
};

const container = connect(
  mapStateToProps
)(ItemDetail);

export default container;


