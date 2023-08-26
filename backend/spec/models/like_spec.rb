require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:likeable_type) }
  it { should validate_presence_of(:likeable_id) }

  it "belongs to a user" do
    should belong_to(:user)
  end

  it "belongs to a likeable" do
    should belong_to(:likeable)
  end
end
