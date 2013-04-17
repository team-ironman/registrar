class EmailsController < ApplicationController


  def new
    @user_ids = params[:user_ids]
    @email = Email.new
  end

  def create
    # convert the users to emails

    users_id_array = params[:user_ids].split(" ").map {|u| u.to_i}

    #users_id_array = %w(params[:user_ids])

    #users_array = users_id_array.map {|user| User.find(user)}
      
    # save the email

    @email = Email.new(params[:email])
    #@email.users = users_array

    users_id_array.each do |user|
      @email.email_users.build(:user_id => user)
    end

    @email.save

    redirect_to progress_path

    # have users updated with a new last Emailed date.

  end


end
