class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  # def allowed?
  #   redirect_to root_path, alert: "Not authorized for this user" if current_user.id!=params[:id].to_i
  # end


  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
