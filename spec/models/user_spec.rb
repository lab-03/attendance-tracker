# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  phone                  :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  userable_type          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  student_id             :integer
#  userable_id            :bigint
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
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



  it 'password should be 6 characters' do
    user.password = '12345'
    expect(user).to_not be_valid
  end

  describe 'associations' do
    it { should belong_to(:userable) }
  end


  describe 'validations' do
    it { should validate_presence_of(:email) }
  end




end
