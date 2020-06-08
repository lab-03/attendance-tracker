# == Schema Information
#
# Table name: attendances
#
#  id              :bigint           not null, primary key
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :bigint
#  course_id       :bigint
#  student_id      :bigint
#
require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
