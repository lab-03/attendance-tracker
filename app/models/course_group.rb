# == Schema Information
#
# Table name: course_groups
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :string
#  group_id    :string
#  lecturer_id :string
#
class CourseGroup < ApplicationRecord
 has_many :students


 validates :course_id ,presence: true
 validates :group_id ,presence: true

end
