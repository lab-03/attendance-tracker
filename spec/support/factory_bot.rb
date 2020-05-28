RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

def create_user
  FactoryBot.create :user
end

def new_user
  FactoryBot.build :user
end