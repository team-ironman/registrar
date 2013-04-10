class DirectoryController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def show
    semester = params[:id].to_i
    @users = User.where(:semester_id => semester)
    render :partial => "student_table"
  end

end