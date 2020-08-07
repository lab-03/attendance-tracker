# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  expires_at     :datetime
#  is_boolean     :boolean          default(FALSE)
#  is_rating      :boolean          default(FALSE)
#  is_text        :boolean          default(FALSE)
#  ownerable_type :string
#  question_type  :string
#  text           :string
#  typeable_type  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ownerable_id   :integer
#  typeable_id    :integer
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
