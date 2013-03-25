class PreworkController < ApplicationController

	def index
    if !params[:id]
     user_id = session[:user_id]
    else
      user_id = params[:id]
    end
    @user_courses = User.find(user_id).user_courses
    @student = User.find(user_id)
    all_progress = @student.user_courses.select(:progress)
    progress_array = all_progress.map {|a| a.progress}
    @average = progress_array.inject{ |sum, el| sum + el }.to_f / progress_array.size
    end
end
