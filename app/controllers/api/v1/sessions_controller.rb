class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user &.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 201
    else 
      render json: { error: "Invalid email or password", status: 400 }, status: 400
    end
  end 

  def show
    user = User.find(params[:id])
    render json: UsersSerializer.new(user)
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end