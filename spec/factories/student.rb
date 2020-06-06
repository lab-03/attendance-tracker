FactoryBot.define do
  factory :student do
    id { 1 }
    user { FactoryBot.build(:user) }
  end
end
