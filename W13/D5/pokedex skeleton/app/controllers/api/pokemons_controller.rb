class Api::PokemonsController < ApplicationController

  def index 
    @pokemons = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render :show
  end

  def create

    @pokemon = Pokemon.new(pokemonParams)

    if @pokemon.save
      render :show
    else
      render json: @pokemon.errors.full_messages  
    end

  end


  private

  def pokemonParams
    params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :image_url, :moves => [])
  end

end



