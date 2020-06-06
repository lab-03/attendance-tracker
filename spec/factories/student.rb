FactoryBot.define do
  factory :student do
    id {1}
    user {FactoryBot.build(:user)}
    user_id{"20200139"}
    end
end
