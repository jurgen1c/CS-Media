require 'rails_helper'

RSpec.describe Source, type: :model do
  describe "associations" do
    it { should belong_to(:article) }
  end
end
