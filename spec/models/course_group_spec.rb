# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  group_id   :bigint
#
require 'rails_helper'

RSpec.describe CourseGroup, type: :model do
  subject(:course_group) { build(:course_group) }
  before { course_group.save }
  
  describe 'associations' do
   it { should have_many(:students) }
   it { should have_many(:lecturers) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:course) }
  end
  
  it 'course_id should be present' do
    course_group.course_id = nil 
    expect(course_group).to_not be_valid 
    
  end  
  
 it 'should save when valid' do
    expect(course_group).to be_valid
  end

    

 end
