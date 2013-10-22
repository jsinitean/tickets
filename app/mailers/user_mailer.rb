class UserMailer < ActionMailer::Base
  def send_email(users)
    @users = users
    mail(
      :to => "sinitix1@gmail.com",
      :from => "sinitix1@gmail.com",
      :subject => 'Tickets Request: '
    )
  end
  
end
