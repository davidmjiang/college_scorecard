class UserMailer < ApplicationMailer
  default :from => "teamleaderdavid@collegesc.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to CollegeSC!')
  end
end
