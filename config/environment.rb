# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address                => "smtp.gmail.com",
  :port                   => 587,
  :user_name              => "sinitix1@gmail.com",
  :password               => "bulls12345",
  :authentication         => :plain,
  :enable_starttls_auto   => true
}


# Initialize the rails application
SimpleCms::Application.initialize!