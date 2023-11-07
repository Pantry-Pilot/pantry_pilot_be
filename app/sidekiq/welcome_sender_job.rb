class WelcomeSenderJob
  include Sidekiq::Job

  def perform(name, email)
    UserMailer.initial_email(name, email).deliver_now
  end
end
