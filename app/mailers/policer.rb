class Policer < ActionMailer::Base
  default from: "ironboardpolice@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.policer.past_due.subject
  #
  def past_due(user, past_due_user_courses)
    @user = user
    @past_due_user_courses = past_due_user_courses
    
    mail to: @user.email, subject: "You have past due assignments"
  end

  def welcome(invite)
    @invite = invite
    mail to: @invite.email, subject: "Welcome to Flatiron!"
  end

  def weekly(user)
    @user = user

    mail to: @user.email, subject: "Prework Weekly Notice"
  end

end
