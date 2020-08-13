# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  group_id   :bigint
#
require 'test_helper'

class CourseGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
