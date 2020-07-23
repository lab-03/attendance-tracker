class CourseGroupSerializer < ActiveModel::Serializer

  attributes :course_id, :group_id
  has_many :students

  has_many :lecturers

  belongs_to :course


end
