# == Schema Information
#
# Table name: course_students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  student_id :bigint
#
class CourseStudent < ApplicationRecord
belongs_to :course
belongs_to :student


end
