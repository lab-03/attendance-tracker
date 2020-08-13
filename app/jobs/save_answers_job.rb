class SaveAnswersJob < ApplicationJob

  def perform(answer_params)
    answer = Answer.create! answer_params
    question_type = answer.question.ownerable&.class&.to_s
    lecturer_user_id = answer.question&.ownerable&.session&.lecturer&.user&.id
    return unless lecturer_user_id
    if question_type == "InteractiveQuiz"
      data = {
          type: "InteractiveQuizAnswer",
          answer_id: answer.id,
          choice_num: answer.choice.choice_num
      }
      notification_params = {notification: {title: "A new Answer has been submitted", body: "new answer on the interactive quiz"}, data: data}
      NotificationSenderJob.perform_async([lecturer_user_id], notification_params)
    end
  end

end