require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }
  before { user.save }

  it 'email should be present' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'email should be valid' do
    user.email = 'asd'
    expect(user).to_not be_valid
  end

  it 'password should be present' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'password should be 6 characters' do
    user.password = '12345'
    expect(user).to_not be_valid
  end

  it 'User should have a userable' do
    user.userable = nil
    expect(user).to_not be_valid
  end

  describe 'associations' do
    it { should belong_to(:userable) }
  end


  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  it 'user should be saved when valid' do
    user.userable = build(:student)
    expect(user).to be_valid
  end


end
