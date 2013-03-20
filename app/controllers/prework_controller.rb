class PreworkController < ApplicationController

	def index
		@subjects = Subject.all
		@courses = Course.all
		@user_courses = User.first.user_courses
	end




end
