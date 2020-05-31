# == Schema Information
#
# Table name: attendances
#
#  id              :bigint           not null, primary key
#  course_id       :string
#  course_group_id :string
#  type            :string
#  student_id      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :attendance do
    course_id{'315'}
    course_group_id{'513'}
    type {'ay 7aga'}
    student_id{'20160139'}
    end
end
