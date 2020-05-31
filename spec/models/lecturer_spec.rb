# == Schema Information
#
# Table name: lecturers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :string
#  user_id    :bigint
#

RSpec.describe Lecturer, type: :model do
  subject(:lecturer) { build(:lecturer) }
  before { lecturer.save }
  
  describe 'associations' do
   it { should have_many(:course_groups) }
  end
  
  it 'user_id should be present' do
    lecturer.user_id = nil 
    expect(lecturer).to_not be_valid 
    
  end  



end
