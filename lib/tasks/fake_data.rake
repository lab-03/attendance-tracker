namespace :fake_data do
  desc "generates fake data for testing"

  task :sessions => :environment do
    ratings = [1, 2, 3, 4, 5]
    ActiveRecord::Base.transaction do
      Course.all.each do |course|
        course.lecturer_ids = Lecturer.pluck(:id) if course.lecturer_ids.empty?
        puts "creating for #{course.name}"
        5.times do |num|
          puts "session num #{num + 1}"
          session = course.sessions.create!(lat: num + 30.1, long: num + 32.2, lecturer_id: course.lecturer_ids.first)
          assigned_students = session.assigned_students
          3.times do |quiz_num|
            puts "quiz num #{quiz_num + 1}"
            interactive_quiz = session.interactive_quizzes.create!(name: "quiz #{quiz_num + 1}")
            4.times do |question_num|
              puts "question num #{question_num + 1}"
              question = interactive_quiz.questions.create text: "question ##{question_num + 1}",
                                                           choices_attributes: [{choice_num: 1, correct: true, text: "choice 1"},
                                                                                {choice_num: 2, correct: false, text: "choice 2"},
                                                                                {choice_num: 3, correct: false, text: "choice 3"}]
              assigned_students.each_with_index do |student, student_index|
                puts "student num #{student_index + 1} answer"
                question.answers.create! ownerable: student, choice_id: question.choice_ids[student_index % 3]
              end
            end
          end
          puts "quizzes done"
          puts "feedback  start"
          feed_back = FeedBack.create! session: session
          puts "feedback  questions saving"
          feed_back.questions_attributes = Question.feed_back_questions
          session.save!
          questions = session.feed_back.questions
          puts "feedback  questions answering"

          questions.each do |quest|
            assigned_students.size.times do |rate_num|
              puts "student num #{rate_num + 1} answer"
              quest.answers.create!(rating: ratings[rate_num % 5], ownerable: assigned_students[rate_num])
            end
          end
        end
      end
    end
  end
end
