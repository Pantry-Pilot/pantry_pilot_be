require "rails_helper"

RSpec.describe "Create A User endpoint" do
  describe "when I send a request to /api/v1/register" do
    it "validate a user and send a successful response back" do
      user = User.create(name: "Guy", email: "guy@gmail.com", password: "password")
      post "/api/v1/login", params:  { email: "guy@gmail.com", password: "password", password_confirmation: "password"} 
      
      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body[:data]).to be_a(Hash)
      expect(response_body[:data]).to have_key(:id)
      expect(response_body[:data][:id]).to eq(user.id.to_s)
      expect(response_body[:data][:attributes][:name]).to eq(user.name)
      expect(response_body[:data][:attributes][:email]).to eq(user.email)
    end
  end
  
  it "returns an error if the user is not found" do
    user = User.create(name: "Guy", email: "guy@gmail.com", password: "password")
    post "/api/v1/login", params:  { email: "notguy@gmail.com", password: "notpassword", password_confirmation: "notpassword"} 

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:error]).to eq("Invalid email or password")
    expect(response_body[:status]).to eq(400)  
  end
end