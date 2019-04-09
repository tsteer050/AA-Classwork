import React from 'react';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      
    }
    this.sendPoke = this.sendPoke.bind(this);
  }

  sendPoke(e) {
    e.preventDefault();
    this.props.createPokemon({
      //use the state 
    })
  }

  render() {

    return (
      <form action="" method="post">
        <label>
        Create a Pokemon
        <input type="text" name="" id=""/>
        </label>
        <input type="submit" name="Submit" onClick={this.sendPoke}/>
      </form>
    )
    
  }

}

export default PokemonForm;