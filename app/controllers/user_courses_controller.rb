class UserCoursesController < ApplicationController

	def update_average
	  @user_course = load_user_course(params[:user_course_id])
	  @user_course.progress = params[:progress]
	  @user_course.save

	  @total_progress = @user_course.user.overall_progress
	  respond_to do |format|
	    format.js
	  end
  end

  def update_progress
    user_id = session[:user_id]
    @user = User.find(user_id)
    @user.update_progress
    redirect_to prework_path
  end

  def update_time_spent
    @user_course = load_user_course(params[:user_course_id])
    @user_course.time_spent = params[:time_spent]
    @user_course.save
    render :nothing => true
  end

  private
  
    def load_user_course(user_course_id)
      user_course = UserCourse.find(user_course_id)
      return user_course if user_course.user_id == authorized_user.id
      "No access to user course or none exists."
    end

end
