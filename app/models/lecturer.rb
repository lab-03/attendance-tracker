# == Schema Information
#
# Table name: lecturers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :string
#  user_id    :bigint
#
class Lecturer < ApplicationRecord
 has_many :course_groups



 validates :user_id ,presence: true
 validates :course_id ,presence: true

end
