require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'associations' do
    it { should have_many(:articles) }
  end
end
