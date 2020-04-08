# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Course < ApplicationRecord
belongs_to :course_group
end
