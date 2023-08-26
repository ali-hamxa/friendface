require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it "has many likes" do
    should have_many(:likes)
  end
end
