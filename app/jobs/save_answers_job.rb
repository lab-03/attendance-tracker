class SaveAnswersJob < ApplicationJob

  def perform(userable_id, answers)
    answers = answers.map do |answer|
      answer.merge(ownerable_type: "Student", ownerable_id: userable_id)
      Answer.create(answer)
    end
    answers_owner = answers.map {|answer| answer.question.ownerable.class.to_s}&.uniq&.first
    lecturer_user_id = answers.first&.question&.ownerable&.session&.lecturer&.user&.id
    return unless lecturer_user_id
    if answers_owner == "InteractiveQuiz"
      data = {
          type: "InteractiveQuizAnswer",
          answers: answers.map {|answer| answer.choice&.choice_num},
          choice_num: answers.map {|answer| answer.choice&.choice_num}.first
      }
      notification_params = {notification: {title: data[:answers].first, body: "new answer on the interactive quiz"}, data: data}
      NotificationSenderJob.perform_async([lecturer_user_id], notification_params)
    end
  end

end