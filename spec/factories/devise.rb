FactoryBot.define do
  factory :user do
    id {1}
    email {'test@test.test'}
    password {"123123A!"}
    first_name {"test"}
    last_name {"bot"}
  end
end
