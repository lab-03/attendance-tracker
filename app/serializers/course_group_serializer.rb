# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  group_id   :bigint
#
class CourseGroupSerializer < ActiveModel::Serializer

  attributes :course_id, :group_id
  has_many :students

  has_many :lecturers

  belongs_to :course


end
