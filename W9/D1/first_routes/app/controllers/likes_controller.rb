class LikesController < ApplicationController
    def index
        if params.has_key?(:user_id)
            likes = User.find(params[:user_id]).liked_comments
            likes << User.find(params[:user_id]).liked_artworks
            render json: likes
        elsif params.has_key?(:artwork_id)
            likes = Artwork.find(params[:artwork_id]).liking_users
            render json: likes
        elsif params.has_key?(:comment_id)
            likes = Comment.find(params[:comment_id]).liking_users
            render json: likes
        else
            render json: likes.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
      
        like = Like.new(like_params)
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end 

    def destroy
        like = Like.find(params[:id])

        render json: like.destroy
    end

    private
    def like_params
        params.require(:like).permit(:likeable_id, :likeable_type, :user_id)
    end
end