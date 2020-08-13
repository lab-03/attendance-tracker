class ApplicationJob
  include Sidekiq::Worker
  sidekiq_options retry: false, backtrace: 20
end
