# == Schema Information
#
# Table name: course_groups
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :string
#  group_id    :string
#  lecturer_id :string
#
require 'rails_helper'

RSpec.describe CourseGroup, type: :model do
  subject(:course_group) { build(:course_group) }
  before { course_group.save }
  
  describe 'associations' do
   it { should have_many(:students) }
  end
  
    

 end
