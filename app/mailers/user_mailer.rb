class UserMailer < ActionMailer::Base
  def send_email(user)
    @user = user
    mail(
      :to => "jeremy.sinitean@gmail.com",
      :from => "#{user[:name]} <#{user[:email]}>",
      :subject => 'Tickets Request: '+user.name
    )
  end
  
end
