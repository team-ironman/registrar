class CoursesController < ApplicationController

	def index
		@subjects = Subject.all
	end

	def show
		@course = Course.find(params[:id])
	end

end
