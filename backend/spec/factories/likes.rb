FactoryBot.define do
  factory :like do
    date { DateTime.now }
    user
    association :likeable, factory: :post
  end
end
