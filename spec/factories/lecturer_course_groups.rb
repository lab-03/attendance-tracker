# == Schema Information
#
# Table name: lecturer_course_groups
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :string
#  lecturer_id     :string
#
FactoryBot.define do
  factory :lecturer_course_group do
    Lecturer_id { "MyString" }
    Course_Group_id { "MyString" }
  end
end
