class ApplicationController < ActionController::Base

    def sign_in(user)
        @current_user = user 
        session[:session_token] = @current_user.reset_session_token!
    end

    def current_user
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

end
