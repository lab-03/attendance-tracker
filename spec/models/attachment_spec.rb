# == Schema Information
#
# Table name: attachments
#
#  id              :bigint           not null, primary key
#  attachment_data :text
#  ownerable_type  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ownerable_id    :integer
#
require 'rails_helper'

RSpec.describe Attachment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
