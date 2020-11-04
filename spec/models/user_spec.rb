require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(id: 1) }
  let(:friend) { User.new(id: 2) }
  let(:following) { Following.new(id: 1, user_id: 1, friend_id: 2) }

  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:comments) }
    it { should have_many(:reviews) }
    it { should have_many(:followings) }
    it { should have_many(:inverse_followings).class_name('Following') }
  end

  describe 'methods' do
    context 'follows' do
      it 'should return an array' do
        expect(user.follows).to be_an(Array)
      end
    end

    context 'follow?' do
      it 'should return a boolean' do
        expect(user.follow?(user)).to be_kind_of(FalseClass || TrueClass)
      end
    end
  end
end
