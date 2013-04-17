ActiveAdmin.register Email do
  
  controller do
        
    def new
      @user_ids = params[:user_ids]
      @email = Email.new
    end

    def create
      # collect user ids
      users_id_array = params[:user_ids].split(" ").map {|u| u.to_i}
      
      #test this method later: users_id_array = %w(params[:user_ids])

      # convert user ids to User objects
      users_array = users_id_array.map {|user| User.find(user)}

      # instantiate an email with subject and body from params
      @email = Email.new(params[:email])
      #@email.users = users_array

      users_id_array.each do |user|
        @email.email_users.build(:user_id => user)
      end

      if @email.save
        @body = params[:email][:body]
        @subject = params[:email][:body]
        @users = params

      redirect_to dashboard_path

      # have users updated with a new last Emailed date.

    end
  end

end