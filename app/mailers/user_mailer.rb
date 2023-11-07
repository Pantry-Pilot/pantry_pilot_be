class UserMailer < ApplicationMailer
  def initial_email(user)
    @user = user

    mail(to: @user.email, subject: 'Thanks for checking out PantryPilot!')
  end
end
