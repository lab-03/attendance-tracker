# == Schema Information
#
# Table name: course_students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :string
#  student_id :string
#
require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
