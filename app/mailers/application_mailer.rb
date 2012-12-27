class ApplicationMailer < ActionMailer::Base
  default from: "jason.merwe@gmail.com"

  def contact
    mail(to: "6507141506@text.att.net", subject: "Feedback")
  end
  
  def welcome_msg(user, msg, to)
    @user = user
    @msg = msg
    mail(to: to, subject: "")
  end

  def welcome_msg(user, msg, to)
    @user = user
    @msg = msg
    mail(to: to, subject: "")
  end
  
  def workout_msg(user, workout, to)
    @user = user
    @workout = workout
    mail(to: to, subject: "")
  end
end
