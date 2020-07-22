# == Schema Information
#
# Table name: attendances
#
#  id              :bigint           not null, primary key
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :bigint
#  course_id       :bigint
#  student_id      :bigint
#
class Attendance < ApplicationRecord
 belongs_to :course_group
 belongs_to :student


 # validates :course ,presence: true
 validates :course_group ,presence: true
 validates :student ,presence: true


end
