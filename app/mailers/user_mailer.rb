class UserMailer < ActionMailer::Base
  def send_email(user)
    @user = user
    mail(
      :to => "sinitix1@gmail.com",
      :from => "sinitix1@gmail.com",
      :subject => 'Tickets Request: '+user.name
    )
  end
  
end
