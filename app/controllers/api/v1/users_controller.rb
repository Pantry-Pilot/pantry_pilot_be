class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    name = user.name
    email = user.email
    if user.save
      render json: UsersSerializer.new(user), status: 201
      WelcomeSenderJob.perform_async(name, email)
    else
      render json: { error: user.errors.full_messages.to_sentence, status: 400 }, status: 400
    end
  end


  private

  def user_params
    params.permit(:name, :email, :password)
  end
end