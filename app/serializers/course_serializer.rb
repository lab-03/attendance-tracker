# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CourseSerializer < ActiveModel::Serializer
  attributes :name
  has_many :course_groups
  has_many :students
  has_many :lecturers
end
