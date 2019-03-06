class CommentsController < ApplicationController
    def index
        if params.has_key?(:user_id)
            comments = User.find(params[:user_id]).comments
            render json: comments
        elsif params.has_key?(:artwork_id)
            comments = Artwork.find(params[:artwork_id]).comments
            render json: comments
        else
            render json: comments.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end 

    def destroy
        comment = Comment.find(params[:id])

        render json: comment.destroy
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end