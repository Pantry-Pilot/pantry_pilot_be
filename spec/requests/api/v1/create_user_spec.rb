require 'rails_helper'

RSpec.describe "Create A User endpoint" do
  describe "creating user using /register endpoint" do
    it "can create a user in the database" do 
      post "/api/v1/register", params: {name: "Person", email: "person@gmail.com", password_digest: "password", password_confirmation: "password"}

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(User.last.name).to eq("Person")
      expect(User.count).to eq(1)
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data]).to be_a(Hash)
      expect(response_body[:data]).to have_key(:id)
      expect(response_body[:data][:id]).to eq(User.last.id.to_s)
      expect(response_body[:data][:attributes][:name]).to eq(User.last.name)
      expect(response_body[:data][:attributes][:email]).to eq(User.last.email)
    end
  end
end