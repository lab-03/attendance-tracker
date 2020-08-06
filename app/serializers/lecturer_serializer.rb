# == Schema Information
#
# Table name: lecturers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class LecturerSerializer < ActiveModel::Serializer
  
  attributes :id, :first_name, :last_name, :user_id, :email
  has_many :courses
  has_many :course_groups
end
