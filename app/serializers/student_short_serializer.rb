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
class StudentShortSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :image , :email,  :user_id

  def image
    object.image_url
  end
end
