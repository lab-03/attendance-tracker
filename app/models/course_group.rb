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
class CourseGroup < ApplicationRecord
 has_many :students
end
