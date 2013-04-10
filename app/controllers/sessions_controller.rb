class SessionsController < ApplicationController
  skip_before_filter :authorize
  layout 'credentials'
  
  def new

  end

  def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to prework_url, notice: "LOGGED IN!"
	  else
	    redirect_to new_session_url, notice: "Email or Password Invalid"
	  end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Logged out"
  end
end
