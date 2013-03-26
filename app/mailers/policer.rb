class Policer < ActionMailer::Base
  default from: "ironboardpolice@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.policer.past_due.subject
  #
  def past_due(user)
    @user = user

    mail to: @user.email, subject: "You have past due assignments"
  end


  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Welcome to Flatiron!"
  end

  def weekly(user)
    @user = user

    mail to: @user.email, subject: "Prework Weekly Notice"
  end

end
