class ApplicationMailer < ActionMailer::Base
  default from: "jason.merwe@gmail.com"

  def contact
    mail(to: "8655482427@vtext.com", subject: "Feedback")
  end
end
