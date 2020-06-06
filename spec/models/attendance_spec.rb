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

  describe 'validations' do
    it { is_expected.to validate_presence_of(:student) }
    it { is_expected.to validate_presence_of(:course_group) }
  end


  it 'course_id should be present' do
    expect(attendance.course_group.course_id).to be_present
  end


  it 'course_group_id should be present' do
    attendance.course_group_id = nil
    expect(attendance).to_not be_valid
  end


  it 'student_id should be present' do
    attendance.student_id = nil
    expect(attendance).to_not be_valid
  end


  it 'should save when valid' do
    expect(attendance).to be_valid
  end


end
