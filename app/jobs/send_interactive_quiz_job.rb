class SendInteractiveQuizJob < ApplicationJob

  def perform(session_id, quiz_params)
    session = Session.find(session_id)
    quiz = session.interactive_quizzes.create!(quiz_params)
    student_user_ids = session.assigned_students_user_ids
    NotificationSenderJob.perform_async(student_user_ids, quiz.notification_json)
  end
end