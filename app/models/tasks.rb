class Tasks

  
  #content for someone's get_started email
  def self.get_started_courses(user)
    @user = user
    


    courses = Course.week_one_courses



  end


  #content for weekly email
  def weekly_email_content

    
  end


  #content for scolding email
  def scolding_email_content

    
  end












  def self.past_due_email
    
    User.all.each do |user|
      # user = User.first
      past_due_user_courses = user.user_courses.past_due_courses(21)
      Policer.past_due(user, past_due_user_courses).deliver
    end

  end

end


