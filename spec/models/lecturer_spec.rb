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
   it { should have_many(:courses) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
  end

  it 'should save when valid' do
    expect(lecturer).to be_valid
  end



end
