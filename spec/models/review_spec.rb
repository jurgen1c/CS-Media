require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { should belong_to(:reviewer).class_name('User') }
    it { should belong_to(:article) }
  end
end
