require 'rails_helper'

RSpec.describe Concert, type: :model do
  describe 'validations' do
    it { should validate_presence_of :band_name }
    it { should validate_presence_of :venue }
    it { should validate_presence_of :concert_date }
  end

  describe 'relationships' do
    it { should have_many :photos }
    it { should have_many :user_concerts }
    it { should have_many(:users).through(:user_concerts) }
  end
end
