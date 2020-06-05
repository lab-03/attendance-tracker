# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :string
#  group_id   :string
#
class CourseGroup < ApplicationRecord
 
 has_many :course_group_students	
 has_many :students , through: :course_group_students

 has_many :lecturer_course_groups
 has_many :lecturers , through:  :lecturer_course_groups

 belongs_to :course



 validates :course ,presence: true

end
