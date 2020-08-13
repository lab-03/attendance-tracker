class SendFeedBackJob < ApplicationJob

  def perform(session_id)
    session = Session.find(session_id)
    feed_back = FeedBack.find_or_create_by(session: session)
    feed_back.questions_attributes = get_questions_attributes
    feed_back.save!
    assigned_students_user_ids = session.assigned_students_user_ids
    NotificationSenderJob.perform_async(assigned_students_user_ids, feed_back.notification_json)
  end

  private

  def get_questions_attributes
    Question.by_type("feed_back").map do |q|
      q.attributes.except "id", "created_at", "updated_at", "ownerable_id", "ownerable_type"
    end
  end

end