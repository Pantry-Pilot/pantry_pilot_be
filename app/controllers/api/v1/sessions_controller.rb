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
    begin
      user = User.find(params[:id])
      render json: UsersSerializer.new(user)
    rescue ActiveRecord::RecordNotFound
       render json: {error: "User not found", status: 404}, status: 404
    end 
  end

  def oauth
    user = User.find_by(email: params[:email])
    if user
      render json: UsersSerializer.new(user), status: 201
    else
      render json: { error: "User not found - Please create an account first before signing up with logging in with google", status: 400 }, status: 400
    end
  end 

  private
  #not needed for the time being
  # def user_params
  #   params.permit(:name, :email, :password)
  # end
end