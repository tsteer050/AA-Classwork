class ArtworkCollectionsController < ApplicationController
 
    def index
        if params.has_key?(:collection_id)
            collection = ArtworkCollection.find(params[:collection_id])
            render json: collection.artworks
        else
            render json: ArtworkCollection.all.artworks
        end
    end  

    def create
        artwork_collection = ArtworkCollection.new(artwork_collection_params)
        if artwork_collection.save
            render json: artwork_collection
        else
            render json: artwork_collection.errors.full_messages, status: :unprocessable_entity
        end
    end 

    def destroy
        artwork_collection = ArtworkCollection.find(params[:id])

        render json: artwork_collection.destroy
    end

    private
    def artwork_collection_params
        params.require(:artwork_collection).permit(:artwork_id, :user_id, :collection_id)
    end
end