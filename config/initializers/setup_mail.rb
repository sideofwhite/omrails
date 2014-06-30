ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gmail.com",  
  :user_name            => "noreplypodium@gmail.com",  
  :password             => "podiumpodium1",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  