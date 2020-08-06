# == Schema Information
#
# Table name: sessions
#
#  id             :bigint           not null, primary key
#  classable_type :string
#  duration       :time
#  token          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  classable_id   :integer
#  lecturer_id    :bigint           not null
#
# Indexes
#
#  index_sessions_on_lecturer_id  (lecturer_id)
#  index_sessions_on_token        (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (lecturer_id => lecturers.id)
#
require 'rails_helper'

RSpec.describe Session, type: :model do
  subject(:session) { build(:session) }
  before { session.save }

  describe 'associations' do
    it { should belong_to(:lecturer) }
    it { should belong_to(:classable) }
    it { should have_many(:attendances) }
    it { should have_one(:attachment) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:lecturer) }
    it { is_expected.to validate_presence_of(:classable) }
    it { is_expected.to validate_presence_of(:attachment) }
  end


  it 'should save when valid' do
    expect(session).to be_valid
  end
end
