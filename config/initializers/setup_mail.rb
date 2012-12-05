ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "jeremy.sinitean@gmail.com",
  :password             => "chicagocubs44",
  :authentication       => :plain,
  :enable_starttls_auto => true
}