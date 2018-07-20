class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?  #makes methods available to views
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #find user in database based on id, if not already logged in. 
    
  end
  
  def logged_in?
    !!current_user #return true or false based on if a user is logged in or not
  end
  
  def require_user
    if !logged_in?  #if user is not logged in
    flash[:danger] = "You must be logged in to do this" #flash this message
    redirect_to root_path #return user to root
    end
  end
end
