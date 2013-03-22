class PreworkController < ApplicationController

	def index
    if !params[:id]
     user_id = 1
    else
      user_id = params[:id]
    end
    @user_courses = User.find(user_id).user_courses
	end

  def create_associations
    @courses = Course.all
    @courses.each do |course|
      if !self.courses.include?(course.id)
        self.add_course_to_user(course.id)
      end
    end
  end

end
