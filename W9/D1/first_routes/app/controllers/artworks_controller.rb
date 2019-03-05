class ArtworksController < ApplicationController
    def show
        render json: Artwork.find(params[:id])
    end

    def index
        # /users/:user_id/artworks
        user_id = params[:user_id]

        owned_artwork = Artwork.where(:artist_id => user_id)
        viewed_artwork = ArtworkShare.where(:viewer_id => user_id).first.artwork

        render json: { 
            owned_artwork: owned_artwork, 
            viewed_artwork: viewed_artwork
            status: :ok
        }
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