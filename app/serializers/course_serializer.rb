class CourseSerializer < ActiveModel::Serializer
  attributes :name
  has_many :course_groups
  has_many :students
  has_many :lecturers
end
