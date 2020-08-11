# == Schema Information
#
# Table name: interactive_quizzes
#
#  id         :bigint           not null, primary key
#  ended_at   :datetime
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :bigint           not null
#
# Indexes
#
#  index_interactive_quizzes_on_session_id  (session_id)
#
# Foreign Keys
#
#  fk_rails_...  (session_id => sessions.id)
#
FactoryBot.define do
  factory :interactive_quiz do
    name { "MyString" }
    session { nil }
    ended_at { "2020-08-10 14:09:13" }
  end
end
