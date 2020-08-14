class NotificationSenderJob < ApplicationJob
  # queue "notifications"

  def perform(user_ids, data)
    tokens = DeviceToken.where(user_id: user_ids).pluck(:token).uniq
    tokens.each_slice(20).to_a.each do |array_tokens|
      PushNotification.new_notification(array_tokens, data)
    end
  end
end
