ActiveAdmin.register Email do
  
  controller do
        
    def new
      @user_ids = params[:user_ids]
      @email = Email.new
    end

    def create
      # collect user ids
      user_ids_array = params[:user_ids].split(" ").map {|u| u.to_i}
      #test this method later: users_id_array = %w(params[:user_ids])

      # convert user ids to User objects
      users_array = user_ids_array.map {|user| User.find(user)}

      # instantiate an email with subject and body from params
      @email = Email.new(params[:email])

      #build the associations
      user_ids_array.each { |id| @email.email_users.build(:user_id => id) }

      #save the email and assign the subject, body, and email address for the mailer.
      if @email.save
        body = params[:email][:body]
        subject = params[:email][:subject]
        user_emails = users_array.map { |user| user.email }
    
        Policer.scolding(user_emails, subject, body).deliver
        
        # have users updated with a new last Emailed date.
        users_array.each { |user| user.last_emailed = Time.now }
      
      end

        redirect_to dashboard_path
    end
  end
end