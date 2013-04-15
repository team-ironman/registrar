class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  def authorize
  	redirect_to new_session_url, alert: "Not authorized" if authorized_user.nil?
  end


  def index
    if authorized_user
      redirect_to prework_path, :notice => flash[:notice]
    else
      redirect_to new_session_path, :success => flash[:success]
    end
  end

  private
  def authorized_user
    @authorized_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :authorized_user
end
