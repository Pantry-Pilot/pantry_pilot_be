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
    
  describe "when I visit /api/v1/users/:id" do
    it "returns a users name and users email as a json object" do
      user = User.create(id: 1, name: "Guy", email: "guy@gmail.com", password: "password")
      get "/api/v1/users/#{user.id}"
      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body[:data]).to be_a(Hash)
      expect(response_body[:data]).to have_key(:id)
      expect(response_body[:data][:id]).to eq(user.id.to_s)
      expect(response_body[:data]).to have_key(:attributes)
      expect(response_body[:data][:attributes][:name]).to eq(user.name)
    end
    
    it "sad path returns a 404 error with message if user is not found" do 
      user = User.create(id: 1, name: "Guy", email: "guy@gmail.com", password: "password")
      bad_user_id = 2
      get "/api/v1/users/#{bad_user_id}"
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
  
      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body[:error]).to eq("User not found")
      expect(response_body[:status]).to eq(404)
    end
  end 

  describe 'GET /api/v1/auth/google_oauth2/callback' do
    context 'when user exists and email is verified' do
      it 'returns 201 and the user id' do
        user = create(:user)
        mock_oauth_data = {
          email: user.email,
        }

        get '/api/v1/auth/google_oauth2/callback', params: mock_oauth_data
        expect(response).to have_http_status(:created)
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:data][:id]).to eq(user.id.to_s)
      end
    end

    context 'when user does not exist' do
      it 'returns 400 and an error message' do
        mock_oauth_data = {
            email: 'imposter@example.com',
          }

        get '/api/v1/auth/google_oauth2/callback', params: mock_oauth_data
        expect(response).to have_http_status(:bad_request)
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:error]).to eq('User not found')
      end
    end
  end
end