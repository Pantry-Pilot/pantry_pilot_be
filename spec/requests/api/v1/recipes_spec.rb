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

  describe 'GET #show', :vcr do
    it 'returns a successful response' do
      get '/api/v1/recipes/637876'

      expect(response).to be_successful
    end

    it 'returns the correct serialized data' do
      get '/api/v1/recipes/637876'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a Hash
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a Hash
      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to be_a String
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to be_a Hash
      expect(json[:data][:attributes]).to have_key(:id)
      expect(json[:data][:attributes][:id]).to be_a Integer
      expect(json[:data][:attributes]).to have_key(:title)
      expect(json[:data][:attributes][:title]).to be_a String
      expect(json[:data][:attributes]).to have_key(:summary)
      expect(json[:data][:attributes][:summary]).to be_a String
      expect(json[:data][:attributes]).to have_key(:ingredients)
      expect(json[:data][:attributes][:ingredients]).to be_an Array
      expect(json[:data][:attributes][:ingredients].first).to be_a Hash
      expect(json[:data][:attributes][:ingredients].first).to have_key(:id)
      expect(json[:data][:attributes][:ingredients].first[:id]).to be_a Integer
      expect(json[:data][:attributes][:ingredients].first).to have_key(:name)
      expect(json[:data][:attributes][:ingredients].first[:name]).to be_a String
      expect(json[:data][:attributes][:ingredients].first).to have_key(:amount)
      expect(json[:data][:attributes][:ingredients].first[:amount]).to be_a Float
      expect(json[:data][:attributes][:ingredients].first).to have_key(:unit)
      expect(json[:data][:attributes][:ingredients].first[:unit]).to be_a String
    end
  end
end
