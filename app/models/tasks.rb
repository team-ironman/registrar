class Tasks

  def past_due_email
    
    user = User.find(3)
    
    Policer.past_due(user).deliver
  end

end