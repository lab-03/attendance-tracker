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
 belongs_to :course_group
 belongs_to :student


 validates :course_id ,presence: true
 validates :course_group_id ,presence: true
 validates :type ,presence: true
 validates :student_id ,presence: true


end
