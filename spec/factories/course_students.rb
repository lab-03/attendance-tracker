# == Schema Information
#
# Table name: course_students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  student_id :bigint
#
FactoryBot.define do
  factory :course_student do
    student_id { "MyString" }
    course_id { "MyString" }
  end
end
