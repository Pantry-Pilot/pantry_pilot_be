require 'rails_helper'

RSpec.describe "Send Recipes for a User endpoint" do
  describe "create user_recipes endpoint" do
    xit "can create an endpoint to serve user recipes to the frontend" do
      post 'api/v1/user_recipes'

      expect(response).to be_successful
      expect(response.status).to eq(201)

      response_body = JSON.parse(response.body, symbolize_names: true)
    end
  end
end