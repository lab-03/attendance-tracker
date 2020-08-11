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
class InteractiveQuiz < ApplicationRecord
  belongs_to :session
  has_many :questions
  accepts_nested_attributes_for :questions


  def notification_json
    {
        notification: {
            title: "You have got an interactive quiz to answer",
            body: "Open this notification to answer some quick questions"
        },
        data: {
            type: "interactive_quiz",
            id: self.id,
            question_ids: question_ids
        }
    }
  end
end
