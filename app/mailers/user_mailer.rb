class UserMailer < ActionMailer::Base
  def send_email(user)
    @user = user
    mail(
      :to => "jeremy.sinitean@gmail.com",
      :from => "Jeremy Sinitean <jeremy.sinitean@gmail.com>",
      :subject => 'Tickets Request: '+user.name
    )
  end
  
end
