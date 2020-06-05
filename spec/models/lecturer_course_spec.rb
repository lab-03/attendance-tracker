# == Schema Information
#
# Table name: lecturer_courses
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :string
#  lecturer_id :string
#
require 'rails_helper'

RSpec.describe LecturerCourse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
