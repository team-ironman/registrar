class Policer < ActionMailer::Base
  default from: "ironboardpolice@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.policer.past_due.subject
  #

  def welcome(invite)
    @invite = invite
    mail to: @invite.email, subject: "Welcome to Flatiron!"
  end

  def get_started(user)
    @user = user

    mail to: @user.email, subject: "Get Started On Your Prework"
  end

  def weekly(user, weekly_courses)
    @user = user
    @selected_weeks_courses = weekly_courses

    mail to: @user.email, subject: "Prework Courses Due This Week"
  end

  def past_due(user, past_due_user_courses)
    @user = user
    @past_due_user_courses = past_due_user_courses
    
    mail to: @user.email, subject: "You have past due assignments"
  end


end