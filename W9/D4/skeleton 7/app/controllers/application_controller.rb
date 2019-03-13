class ApplicationController < ActionController::Base

  helper_method :current_user
  
  def current_user
 
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
end