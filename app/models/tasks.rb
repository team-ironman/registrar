class Tasks

  def past_due_email
    
    user = User.find(3)
    
    Policer.past_due(user).deliver
  end

  def show_past_due_courses(user, days_before_class)

    #Get list of courses completed
      # user_courses.progress < 100

    #All courses due (test case week 1)
      # courses.days_due_before_class where > 21





  end




end


