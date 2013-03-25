class PreworkController < ApplicationController

  def index
    if !params[:id]
     user_id = session[:user_id]
    else
      user_id = params[:id]
    end

    @user_courses = UserCourse.all_for_user(user_id)


    @student = User.find(user_id)
<<<<<<< HEAD
    all_progress = @student.user_courses.select(:progress)
    progress_array = all_progress.map {|a| a.progress}
    @average = progress_array.inject{ |sum, el| sum + el }.to_f / progress_array.size
  end

=======
    # all_progress = @student.user_courses.select(:progress)
    # progress_array = all_progress.map {|a| a.progress}
    # @average = progress_array.inject{ |sum, el| sum + el }.to_f / progress_array.size
    @average = @student.overall_progress
    end
>>>>>>> progress % refactor
end
