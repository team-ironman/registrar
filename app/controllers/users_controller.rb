class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

  def new
    @user = User.new
  end

	def add_course_to_user
		# @TODO change to logged in user
		@user = User.find(1)

		@user.user_courses.build(course_id: params[:cid], user_id: 1, progress: 0)
		@user.save
		redirect_to prework_path
	end

end
