class Api::V1::UsersController < ApplicationController

  def create
    # require 'pry';binding.pry
    user = User.create(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password_digest)
  end
end