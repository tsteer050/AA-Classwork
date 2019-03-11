class UsersController < ApplicationController
    
    def index
        @users = User.all 
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user 
            render :show
        else 
            flash.now[:errors] = "User not found"
            render :index
        end
    end

    def create
 
        @user = User.new(user_params)

        if @user.save
            sign_in(@user)
            redirect_to users_url
        else
            flash.now[:errors] = "Could not create user"
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end


end
