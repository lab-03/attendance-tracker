# == Schema Information
#
# Table name: lecturer_courses
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint
#  lecturer_id :bigint
#
class LecturerCourse < ApplicationRecord
belongs_to :lecturer
belongs_to :course




end
