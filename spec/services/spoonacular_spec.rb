require 'rails_helper'

RSpec.describe SpoonacularService do
  context 'instance methods' do
    context '#search_recipes', :vcr do
      it 'returns recipe search' do
        search = SpoonacularService.new.search_recipes({ query: 'chicken' })

        expect(search).to be_a(Hash)
        expect(search[:number]).to be 10
        expect(search[:results]).to be_an(Array)
        expect(search[:results].first).to be_a(Hash)
        expect(search[:results].first).to have_key(:id)
        expect(search[:results].first).to have_key(:title)
        expect(search[:results].first).to have_key(:image)
        expect(search[:results].first).to have_key(:imageType)
      end
    end
  end
end
