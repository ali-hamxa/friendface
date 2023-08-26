require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }

  it "has many likes" do
    should have_many(:likes)
  end
end
