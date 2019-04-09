import React from 'react';
import { Link } from 'react-router-dom';

export const ItemDetail = ({item}) => {
  return (
    <div>
      <h4>Price: {item.price}</h4>
      <h4>Happiness: {item.happiness}</h4>
      <h4><img src={item.image_url} style={{height: "50px", width: "50px"}}/></h4>
      <h4>Pokemon ID: {item.pokemon_id}</h4>
      <h4>Spider Bros are the broest bros</h4>
      <button>Pointless Button</button>
    </div>)
}