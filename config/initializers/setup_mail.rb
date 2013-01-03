ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {   
  :address              => "mail.collegestrong.com",  
  :port                 => 26,  
  :domain               => "collegestrong.com",  
  :user_name            => "workouts@collegestrong.com",  
  :password             => "kutless!1",   
  :enable_starttls_auto => true,
  :openssl_verify_mode  => 'none'
} 


  #:address              => "smtp.gmail.com",  
  #:port                 => 587,  
  #:domain               => "gmail.com",  
  #:user_name            => "jason.merwe@gmail.com",  
  #:password             => "iqnhlidgcihnhfsw",  
  #:authentication       => "plain",  
  #:enable_starttls_auto => true
  #465