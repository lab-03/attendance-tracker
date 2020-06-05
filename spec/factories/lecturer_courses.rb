# == Schema Information
#
# Table name: lecturer_courses
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :string
#  lecturer_id :string
#
FactoryBot.define do
  factory :lecturer_course do
    lecturer_id { "MyString" }
    course_id { "MyString" }
  end
end
