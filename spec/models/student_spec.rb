# == Schema Information
#
# Table name: students
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :string
#  user_id         :bigint
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  subject(:student) { build(:student) }
  before { student.save }

 describe 'associations' do
  it { should have_many(:attendances) }
 end
 
 it 'user_id should be present' do
   student.user_id = nil 
   expect(student).to_not be_valid

 end  

 it 'course_group_id should be present' do
   student.course_group_id = nil 
   expect(student).to_not be_valid

 end 

end
