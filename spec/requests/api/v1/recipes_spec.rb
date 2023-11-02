require 'rails_helper'

RSpec.describe 'Api::V1::Recipes', type: :request do
  describe 'GET #search', :vcr do
    it 'returns a successful response' do
      get '/api/v1/recipes/search', params: { query: 'chicken' }

      expect(response).to be_successful
    end

    it 'returns the correct serialized data' do
      get '/api/v1/recipes/search', params: { query: 'chicken' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a Hash
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an Array
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first[:id]).to be_a String
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].count).to eq(10)
    end
  end
end
