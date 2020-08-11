# == Schema Information
#
# Table name: choices
#
#  id          :bigint           not null, primary key
#  choice_num  :integer
#  correct     :boolean          default(FALSE)
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_choices_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Choice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
