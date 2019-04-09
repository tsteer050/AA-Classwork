import { combineReducers } from 'redux';
import entitiesReducer from './entities_reducer.js';
import { uiReducer } from './ui_reducer.js';  

const rootReducer = combineReducers({
  entities: entitiesReducer,
  // ui: uiReducer
});

export default rootReducer;