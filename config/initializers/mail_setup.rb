ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'russedge.com',
  :user_name            => 'russedgesite@gmail.com',
  :password             => '3odzilla',
  :authentication       => 'plain',
  :enable_starttls_auto => true 
}
