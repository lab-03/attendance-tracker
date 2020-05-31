# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  course_id  :string
#  group_id   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :course_group do
    course_id{'CS!50'}
    group_id{'G5'}
    end
end