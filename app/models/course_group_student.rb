# == Schema Information
#
# Table name: course_group_students
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :string
#  student_id      :string
#
class CourseGroupStudent < ApplicationRecord
belongs_to :student
belongs_to :course_group


	
end
