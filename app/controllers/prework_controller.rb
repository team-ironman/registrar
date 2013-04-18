class PreworkController < ApplicationController

  def index
    @user_courses = load_user_courses
    @user = User.find(@user_id)

    # all_progress = @student.user_courses.select(:progress)
    # progress_array = all_progress.map {|a| a.progress}
    # @average = progress_array.inject{ |sum, el| sum + el }.to_f / progress_array.size
    @average = @user.overall_progress.round(0)
  
  end

  private

# Load user courses, allow if user_id is current user or admin logged in
  def load_user_courses
    user_id = params[:id].blank? ? authorized_user.id : params[:id].to_i
    if user_id == authorized_user.id || current_admin_user
      user_courses = Course.courses_for_user(user_id)
    else
      redirect_to root_url, notice: "Don't try to be someone you're not."    
    end
    @user_id = user_id
    user_courses
  end

end

