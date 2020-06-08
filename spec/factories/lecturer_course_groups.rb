# == Schema Information
#
# Table name: lecturer_course_groups
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :bigint
#  lecturer_id     :bigint
#
FactoryBot.define do
  factory :lecturer_course_group do
    lecturer_id { "MyString" }
    course_group_id { "MyString" }
  end
end
