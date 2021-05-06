require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :concert_date }
    it { should validate_inclusion_of(:loved).in_array([true, false]) }
    it { should validate_inclusion_of(:liked).in_array([true, false]) }
  end


  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :concert }
    it { should have_many :photo_tags }
    it { should have_many(:tags).through :photo_tags }
  end
end
