class DirectoryController < ApplicationController

  def index
    semester_id = params[:semester_id] || current_user.semester_id
    @users = User.where(:semester_id => semester_id)
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

end