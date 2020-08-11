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
class InteractiveQuizSerializer < ActiveModel::Serializer
  attributes :id, :name, :ended_at

  belongs_to :session
  has_many :questions

  def student_answers
    object.questions.map do |question|
      question.answers.map do |answer|
        answer.choice.text
      end.uniq
    end
  end

end
