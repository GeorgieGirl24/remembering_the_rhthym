require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it { should have_many :photos }
    it { should have_many :user_concerts }
    it { should have_many(:concerts).through(:user_concerts) }
  end
end
