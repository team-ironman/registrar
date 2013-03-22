class PreworkController < ApplicationController

	def index
    if !params[:id]
     user_id = 1
    else
      user_id = params[:id]
    end
    @user_courses = User.find(user_id).user_courses

    student = User.first
    all_progress = student.user_courses.select(:progress)
    progress_array = all_progress.map {|a| a.progress}
    @average = progress_array.inject{ |sum, el| sum + el }.to_f / progress_array.size
	end

end
