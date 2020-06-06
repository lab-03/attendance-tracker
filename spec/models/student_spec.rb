# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  subject(:student) { build(:student) }
  before {  student.save }

 describe 'associations' do
  it { should have_many(:attendances) }
  it { should have_many(:course_groups) }
  it { should have_many(:courses) }
 end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
  end



 it 'should save when valid' do
    expect(student).to be_valid
  end

end
