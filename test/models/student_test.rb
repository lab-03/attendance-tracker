# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
