require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:sources) }
    it { should have_many(:reviews) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end
end
