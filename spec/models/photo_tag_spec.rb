require 'rails_helper'

RSpec.describe PhotoTag, type: :model do
    describe 'relationships' do
      it { should belong_to :photo }
      it { should belong_to :tag }
    end
end
