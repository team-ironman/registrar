class PreworkController < ApplicationController

	def index
		@subjects = Subject.all
		@courses = Course.all
		@user_courses_hash = User.first.user_courses_hash
    @user = User.find(1)
    @courses.each do |course|
      if !@user_courses_hash.has_key?(course.id)
        @user.add_course_to_user(course.id)
      end
    end
    @user_courses_hash = User.first.user_courses_hash
	end




end
