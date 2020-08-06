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

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject(:attendance) { create(:attendance) }
  # before { attendance.save }

  describe 'associations' do
    # binding.pry
    it { should belong_to(:session) }
    it { should belong_to(:student) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:student) }
    it { is_expected.to validate_presence_of(:session) }
  end


  it 'should save when valid' do
    # binding.pry
    expect(attendance).to be_valid
  end


end
