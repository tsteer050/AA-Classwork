class ArtworksController < ApplicationController
    def show
        render json: Artwork.find(params[:id])
    end

    def index
        # /users/:user_id/artworks
        user_id = params[:user_id]
        user = User.find(user_id)
        owned_artwork = user.artworks
        viewed_artwork = user.shared_artworks
        
        artworks = owned_artwork
        artworks << viewed_artwork
        
        render json: artworks
 
    end


# complex = Complex.find(params[:id])
# search_params = {complex_id: complex._id}
# fields = Field.where(search_params)

# render json: { complex: complex, fields: fields, 
#     search_params: search_params }, status: :ok



    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end 

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork 
        else 
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])

        render json: artwork.destroy
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end