# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  subject(:student) { build(:student) }
  before { student.save }

 describe 'associations' do
  it { should have_many(:attendances) }
  it { should have_many(:course_groups) }
  it { should have_many(:courses) }
 end
 
 it 'user_id should be present' do
   student.user_id = nil 
   expect(student).to_not be_valid

 end

 it 'should save when valid' do
    expect(student).to be_valid
  end
 

end
