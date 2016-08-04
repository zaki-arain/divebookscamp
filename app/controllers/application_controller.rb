class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to new_session_path unless current_user
  end

  def logged_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end


  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path # halts request cycle
    end
  end

end
