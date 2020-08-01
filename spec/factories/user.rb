FactoryBot.define do
  factory :user do
    email {'test1@test.test'}
    password {"123123A!"}
    first_name {"test"}
    last_name {"bot"}

    trait :with_student_fci_mail do
      email { 'student@stud.fci-cu.edu.eg' }
    end
  end
end
