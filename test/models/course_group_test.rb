# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :string
#  group_id   :string
#
require 'test_helper'

class CourseGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
