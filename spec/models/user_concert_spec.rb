require 'rails_helper'

RSpec.describe UserConcert, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :concert }
  end
end
