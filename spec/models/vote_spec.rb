require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "associations" do
    it { should belong_to(:voter).class_name('User') }
    it { should belong_to(:article) }
  end  
end
