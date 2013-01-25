class ApplicationMailer < ActionMailer::Base
  default from: "workouts@collegestrong.com"

  def contact(from, msg)
    @msg = msg
    mail(to: "jason.merwe@gmail.com", subject: "Feedback from CollegeStrong website")
  end
  
  def welcome_msg(user, to)
    @user = user
    mail(to: to, subject: "Welcome to CollegeStrong")
  end
  
  def workout_msg(user, workout, to)
    @user = user
    @workout = workout
    mail(to: to, subject: "")
  end

  def test_msg(user, to)
    @user = user
    mail(to: to, subject: "")
  end
end
