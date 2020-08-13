# == Schema Information
#
# Table name: answers
#
#  id             :bigint           not null, primary key
#  ownerable_type :string           not null
#  rating         :integer
#  text           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  choice_id      :bigint
#  ownerable_id   :bigint           not null
#  question_id    :bigint           not null
#
# Indexes
#
#  index_answers_on_choice_id                        (choice_id)
#  index_answers_on_ownerable_type_and_ownerable_id  (ownerable_type,ownerable_id)
#  index_answers_on_question_id                      (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
