class ApplicationMailer < ActionMailer::Base
  default from: "workouts@collegestrong.com"

  def contact(from, msg)
    @msg = msg

    mail(to: "jason.merwe@gmail.com", subject: "Feedback from CollegeStrong website")
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
