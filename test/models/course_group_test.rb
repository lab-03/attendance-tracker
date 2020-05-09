# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  course_id  :string
#  group_id   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CourseGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
