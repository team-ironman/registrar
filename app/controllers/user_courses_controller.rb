class UserCoursesController < ApplicationController

	def update_progress
	  @user_course = UserCourse.find(params[:user_course_id])
	  @user_course.progress = params[:progress]
	  @user_course.save

	  @total_progress = @user_course.user.overall_progress
	  respond_to do |format|
	    format.js
	  end
  end

  def update_time_spent
    @user_course = UserCourse.find(params[:user_course_id].to_i)
    @user_course.time_spent = params[:time_spent]
    @user_course.save
    render :nothing => true
  end


end
