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
require 'test_helper'

class LecturerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
