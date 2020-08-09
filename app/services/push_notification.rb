module PushNotification
  require 'fcm'

  def self.new_notification(tokens, data)
    fcm_client = FCM.new(ENV["FB_SERVER_KEY"])
    fcm_client.send(tokens, options(data))
  end

  def self.options(data)
    {priority: 'high'}.merge(data)
  end
end