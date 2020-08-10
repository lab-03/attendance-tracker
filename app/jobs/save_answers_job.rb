class SaveAnswersJob < ApplicationJob

  def perform(userable_id, answers)
    answers = answers.map do |answer|
      answer.merge(ownerable_type: "Student", ownerable_id: userable_id)
      Answer.create(answer)
    end
    answers_owner = answers.map {|answer| answer.question.ownerable.class.to_s}&.uniq&.first
    if answers_owner == "FeedBack"
      # bla bla bla
    elsif  answers_owner == "InteractiveQuiz"
      # bla bla bla 
    end
  end

end