class ApplicationMailer < ActionMailer::Base
  default from: "jason.merwe@gmail.com"

  def contact
    mail(to: "6507141506@text.att.net", subject: "Feedback")
  end
  
  def welcome_msg(user, msg)
    @user = user
    @msg = msg
    mail(to: @user.number_path)
  end
  
end
