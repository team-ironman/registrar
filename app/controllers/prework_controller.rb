class PreworkController < ApplicationController

	def index
    if !params[:id]
     user_id = 1
    else
      user_id = params[:id]
    end
    @user_courses = User.find(user_id).user_courses
	end

end
