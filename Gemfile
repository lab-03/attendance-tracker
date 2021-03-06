source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem "shrine", "~> 3.0"
gem "aws-sdk-s3", "~> 1.14"


# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '~> 0.12.2'
  gem 'rspec-rails', '~> 4.0.0'
  #faking data
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  #factory for creating class instances
  gem 'factory_bot_rails'
  # extension for rspec
  gem 'shoulda', '~> 3.6'
  gem 'shoulda-matchers'

end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
end

group :test do
  gem 'shrine-memory'
  #cleaning the database
  gem 'database_cleaner-active_record'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Log in and logout
gem 'devise'
# token based authentication
gem 'devise_token_auth'
# to add roles on Actors
gem "rolify"

gem 'rack-cors'
# auto builds associations
gem "auto_build"

#strong migrations
gem 'strong_migrations'

#CI and CD
gem 'travis'

#Serializing
gem 'active_model_serializers', '~> 0.10.0'

#for http calls
gem 'httparty'

#for push notifications
gem "fcm"

#for background jobs
gem 'sidekiq', '~> 6.1.0'