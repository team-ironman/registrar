class PreworkController < ApplicationController

  def index
    
    redirect_to new_session_path if session[:user_id].blank?
    
    if user_id = session[:user_id]
      @user_courses = Course.courses_for_user(user_id)

      @student = User.find(user_id)

      # all_progress = @student.user_courses.select(:progress)
      # progress_array = all_progress.map {|a| a.progress}
      # @average = progress_array.inject{ |sum, el| sum + el }.to_f / progress_array.size
      @average = @student.overall_progress.round(0)
  
    end

  end

end
