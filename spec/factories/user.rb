FactoryBot.define do
  factory :user do
    email { "#{Faker::Name.first_name}@stud.fci-cu.edu.eg" }
    password {"123123A!"}
    first_name {"test"}
    last_name {"bot"}
  end
end
