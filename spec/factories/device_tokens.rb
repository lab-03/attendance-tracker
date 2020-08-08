# == Schema Information
#
# Table name: device_tokens
#
#  id          :bigint           not null, primary key
#  device_type :string
#  token       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_device_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :device_token do
    token { "MyString" }
    user { nil }
    device_type { "MyString" }
  end
end
