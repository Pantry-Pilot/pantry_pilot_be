class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user &.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 201
    else 
      render json: { error: "Invalid email or password", status: 400 }, status: 400
    end
  end 
end