# == Schema Information
#
# Table name: course_group_students
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :string
#  student_id      :string
#
FactoryBot.define do
  factory :course_group_student do
    Student_id { "MyString" }
    Group_id { "MyString" }
  end
end
