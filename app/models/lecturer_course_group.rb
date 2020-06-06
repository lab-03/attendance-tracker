# == Schema Information
#
# Table name: lecturer_course_groups
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :bigint
#  lecturer_id     :bigint
#
class LecturerCourseGroup < ApplicationRecord
belongs_to :lecturer
belongs_to :course_group


end
