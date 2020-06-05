# == Schema Information
#
# Table name: lecturers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class Lecturer < ApplicationRecord
 has_many :lecturer_courses	
 has_many :courses , through:  :lecturer_courses

 has_many :lecturer_course_groups
 has_many :course_groups , through:  :lecturer_course_groups



 validates :user_id ,presence: true
 validates :course_id ,presence: true

end
