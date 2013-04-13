class EmailsController < ApplicationController


  def new
    @user_ids = params[:user_ids]
    @email = Email.new
  end

  def create
    email = Email.new(params[:email])

    users.each do user_id
      email.users << (User.find(user_id))
    end

    email.save

  end


end
