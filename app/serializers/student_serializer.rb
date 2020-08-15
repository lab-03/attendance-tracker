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
class StudentSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :image, :email, :user_id
  has_many :course_groups
  has_many :courses

  def attended
    object.attendances.where(verified: true).size
  rescue => e
    0
  end

  def absent
    sessions_count = object.courses.map(&:session_ids).flatten.uniq.size
    attended = object.attendances.where(verified: true).size
    sessions_count - attended
  rescue => e
    0
  end

  def participated
    object.answers.size
  end

end
