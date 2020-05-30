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
  
  describe 'associations' do
    it { should have_many(:course_groups) }
  end
  


 end
