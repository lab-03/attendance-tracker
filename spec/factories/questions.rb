# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  expires_at     :datetime
#  ownerable_type :string
#  question_type  :string
#  text           :string
#  typeable_type  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ownerable_id   :integer
#  typeable_id    :integer
#
FactoryBot.define do
  factory :question do
    text { "MyString" }
    type { "" }
    owner { "" }
  end
end
