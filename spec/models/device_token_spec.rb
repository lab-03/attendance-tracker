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
require 'rails_helper'

RSpec.describe DeviceToken, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
