class ApplicationJob
  include Sidekiq::Worker
  sidekiq_options retry: 3, backtrace: 20
end
