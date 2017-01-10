class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :user_admin?

  def current_user
  	
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]  	
    
  end

  def logged_in?
  	!!current_user
  end

  def user_admin?
  	@admin ||= Admin.find_by(id: session[:user_id]) if session[:user_id]
  	if @admin.nil?
  		return false
  	else
  		return true
  	end
  end 
 
end
