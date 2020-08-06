# == Schema Information
#
# Table name: attendances
#
#  id         :bigint           not null, primary key
#  verified   :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :bigint
#  student_id :bigint
#
# Indexes
#
#  index_attendances_on_session_id  (session_id)
#
require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
