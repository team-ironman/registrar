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
		@user = User.first
		course = @user.courses.build(:course_id => params[:id], :progress => 0)
		@user.save
		redirect_to prework_path
	end

end
