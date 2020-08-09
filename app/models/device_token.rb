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
class DeviceToken < ApplicationRecord
  belongs_to :user
  scope :by_device_type, -> (device_type) { where(device_type: device_type) }

  validates :token, :device_type, presence: true
end
