# == Schema Information
#
# Table name: course_groups
#
#  id         :bigint           not null, primary key
#  course_id  :string
#  group_id   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CourseGroup, type: :model do
  subject(:course_group) { build(:course_group) }
  before { coursegroup.save }
  
  it { should have_many(:students) }
  
  it 'course_id should be present' do
   coursegroup.course_id = nil
   expect(coursegroup).to_not be_valid
   
  end
  
  it 'group_id should be present' do
   coursegroup.group_id = nil
   expect(coursegroup).to_not be_valid
   
  end
    


 end
