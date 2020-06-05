# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Course < ApplicationRecord
 has_many :course_groups

 has_many :course_students
 has_many :students , through: :course_students

 has_many :lecturer_courses
 has_many :lecturers , through:  :lecturer_courses




 validates :name ,presence: true
end
