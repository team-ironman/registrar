class Tasks

  def past_due_email
    
    user = User.find(3)
    
    Policer.past_due(user).deliver
  end

  def show_past_due_courses(user, days_before_class)

    #PROVIDES A "USERCOURSE" OBJECT FOR A USER'S INCOMPLETE COURSES
      u = User.first
      u.user_courses.incomplete

    #PROVIDES A "COURSE" OBJECT WITH WEEK ONE COURSES
      Course.week_one

    #GOAL: RETURN A "COURSE" OBJECT OF WEEK1 INCOMPLETE COURSES

    


  end




end


