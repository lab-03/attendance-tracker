# == Schema Information
#
# Table name: students
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :string
#  user_id         :bigint
#
class Student < ApplicationRecord
  include UserableLogic
  has_many :attendances
  has_many :course_groups


 validates :user_id ,presence: true

end

