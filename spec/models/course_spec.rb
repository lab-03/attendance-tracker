# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Course, type: :model do
  subject(:course) { build(:course) }
  before { course.save }
  
  describe 'associations' do
    it { should have_many(:course_groups) }
    it { should have_many(:lecturers) }
    it { should have_many(:students) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  
  it 'name should be present' do
    course.name = nil 
    expect(course).to_not be_valid
  end  
  
  it 'should save when valid' do
    expect(course).to be_valid
  end


 end
