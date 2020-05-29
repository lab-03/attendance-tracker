# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Course, type: :model do
  subject(:course) { build(:course) }
  before { course.save }

  it { should has_many(:course_groups) }

  it 'name should be present' do
   course.name=nil
   expect(course).to_not be_valid
   end


 end
