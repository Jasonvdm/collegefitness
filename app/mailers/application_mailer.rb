class ApplicationMailer < ActionMailer::Base
  default from: "jason.merwe@gmail.com"

  def contact
    mail(to: "6507141506@text.att.net", subject: "Feedback")
  end
  
  def welcome_msg(user, msg, to)
    @user = user
    @msg = msg
    mail(to: "8655482427@vtext.com")
  end
  
end
