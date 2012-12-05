# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default :content_type => "text/html"
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "jeremy.sinitean@gmail.com",
  :password             => "chicagocubs44",
  :authentication       => :login,
  :enable_starttls_auto => true
}

# Initialize the rails application
SimpleCms::Application.initialize!