# == Schema Information
#
# Table name: attendances
#
#  id              :bigint           not null, primary key
#  course_id       :string
#  course_group_id :string
#  type            :string
#  student_id      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject(:attendance) { build(:attendance) }
  before { attendance.save }
 
 describe 'associations' do
  it { should belong_to(:course_group) }
  it { should belong_to(:student) }
 end
  


end
