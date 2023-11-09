class UserMailer < ApplicationMailer
  def initial_email(name, email)
    @name = name

    mail(to: email, subject: 'Thanks for checking out PantryPilot!')
  end
end
