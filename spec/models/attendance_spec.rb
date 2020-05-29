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

  it { should belong_to(:course_group) }
  it { should belong_to(:student) }
  
  it 'course_id should be present' do
   attendance.course_id=nil
   expect(attendance).to_not be_valid
  end
  
  it 'course_group_id should be present' do
   attendance.course_group_id=nil
   expect(attendance).to_not be_valid
  end
  
  it 'type should be present' do
   attendance.type=nil
   expect(attendance).to_not be_valid
  end

  it 'student_id should be present' do
   attendance.student_id=nil
   expect(attendance).to_not be_valid
  end


end
