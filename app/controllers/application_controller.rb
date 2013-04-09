class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  def authorize
  	redirect_to new_session_url, alert: "Not authorized" if current_user.nil?
  end


  def index
    if current_user 
      redirect_to prework_path, :notice => flash[:notice]
    else
      redirect_to new_session_path, :notice => flash[:notice]
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
