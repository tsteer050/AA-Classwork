class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    user.password = user_params[:password]
    
    if user.save
      redirect_to cats_url
    else
      flash[:nope] = "It didn't work, bro."
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end