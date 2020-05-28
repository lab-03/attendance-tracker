# == Schema Information
#
# Table name: attendances
#
#  id              :bigint           not null, primary key
#  course_id       :string
#  course_group_id :string
#  type            :string
#  student_id      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Attendance < ApplicationRecord
 belong_to :course_group
 belong_to :student
end
