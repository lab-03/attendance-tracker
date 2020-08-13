namespace :db_tasks do
  desc "This task is called by the Heroku scheduler add-on to reset the demo"
  task :clean => :environment do
    puts "Cleaning Up The DB..."
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    puts "Seeding the DB again..."
    Rake::Task["db:seed"].invoke
    puts "done!"
  end
end
