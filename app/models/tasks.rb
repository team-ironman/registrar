class Tasks

  def self.past_due_email
    
    User.all.each do |user|
      # user = User.first
      past_due_user_courses = user.user_courses.past_due_courses(21)
      Policer.past_due(user, past_due_user_courses).deliver
    end

  end


end


