class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    # debugger
    user = User.find_by_credentials(
        
      params[:user][:user_name],
      params[:user][:password]
    )

    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to cats_url
    else  
      flash.now[:nope] = "Try again, bro."
      render :new
    end

  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil 
    end
  end

  private

  def session_params
    params.require(:session).permit(:user_name, :password)
  end

end