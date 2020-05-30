# == Schema Information
#
# Table name: students
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_group_id :string
#  user_id         :bigint
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  subject(:student) { build(:student) }
  before { student.save }

 describe 'associations' do
  it { should have_many(:attendances) }
 end
  



end
