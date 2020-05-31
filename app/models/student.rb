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
end
