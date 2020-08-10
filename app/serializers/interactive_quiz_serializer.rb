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