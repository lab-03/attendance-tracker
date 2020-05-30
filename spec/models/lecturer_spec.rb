# == Schema Information
#
# Table name: lecturers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

RSpec.describe Lecturer, type: :model do
  subject(:lecturer) { build(:lecturer) }
  before { lecturer.save }
  
  describe 'associations' do
   it { should have_many(:course_groups) }
  end
  




end