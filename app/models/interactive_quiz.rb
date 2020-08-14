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
  has_many :questions, as: :ownerable
  accepts_nested_attributes_for :questions

  def total_students_participated
    questions.map do |question|
      question.answers.map do |answer|
        answer.ownerable.id
      end.uniq
    end.flatten.uniq.size
  end

  def total_right_answers
    Answer.where(choice_id: Choice.where(question_id: question_ids, correct: true)).size
  end

  def questions_with_choices
    questions.map do |question|
      {
          text: question.text,
          choices: question.choices.map do |choice|
            {
                text: choice.text,
                correct: choice.correct,
                no_students_choosed: question.answers.where(choice_id: choice.id).size
            }
          end
      }
    end
  end



  def notification_json
    {
        notification: {
            title: "You have got an interactive quiz to answer",
            body: "Open this notification to answer some quick questions"
        },
        data: {
            type: "interactive_quiz",
            id: self.id,
            question_ids: question_ids.first
        }
    }
  end
end
