FactoryBot.define do
  factory :student do
    user
    email { 'student@stud.fci-cu.edu.eg' }
    image { File.open("#{Rails.root}/spec/files/images/students/student.jpeg") }
  end
end
