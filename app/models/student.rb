# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class Student < ApplicationRecord
  include UserableLogic
  include ImageUploader::Attachment(:image)
  has_many :attendances

  has_many :course_group_students
  has_many :course_groups , through:  :course_group_students

  has_many :course_students
  has_many :courses , through: :course_students

end

