# == Schema Information
#
# Table name: lecturer_course_groups
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :string
#  lecturer_id     :string
#
require 'rails_helper'

RSpec.describe LecturerCourseGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
