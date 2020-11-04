require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:follow).class_name('User') }
  end
end
