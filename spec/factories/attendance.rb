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
    student
    session
    # association :student, factory: :student
    # association :session, factory: :session
    verified { false }
  end
end
