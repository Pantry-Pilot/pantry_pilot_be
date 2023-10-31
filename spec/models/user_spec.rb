require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
    it { should validate_presence_of(:name), uniqueness: true }
    it { should validate_presence_of(:email), uniqueness: true }
    it { should validate_presence_of(:password_digest) }
  end
end
