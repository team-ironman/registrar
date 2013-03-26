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


end
