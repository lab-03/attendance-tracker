class SessionReportSerializer < ActiveModel::Serializer
  attributes :id, :duration, :ended_at, :created_at, :updated_at, :apply_checks, :lat, :long, :qr_code_base64,
             :token, :by_teacher, :attendance, :participants, :feedback

  def by_teacher
    {
        name: object.lecturer&.name,
        user_id: object.lecturer&.user.id,
        lecturer_id: object.lecturer_id
    }
  end

  def attendance
    total_students = object.assigned_students.size
    attended_students = object.attended_students.size
    unattended_students = (total_students - attended_students)
    {
        total_students: total_students,
        attended_students: attended_students,
        unattended_students: unattended_students
    }
  end

  def interactive_quizzes
    interactive_quizzes = object.interactive_quizzes
    return [] if interactive_quizzes.empty?
    interactive_quizzes.map do |interactive_quiz|
      {   name: interactive_quiz.name,
          total_students: interactive_quiz.total_students_participated,
          total_right_answers: interactive_quiz.total_right_answers,
          total_questions: interactive_quiz.question_ids.size,
          questions: interactive_quiz.questions_with_choices,
          ended_at: interactive_quiz.ended_at,
          started_at: interactive_quiz.created_at
      }
    end
  end

  def feedback
    questions = object.feed_back&.questions || []
    return [] if questions.empty?
    questions.map do |question|
      {
          text: question.text,
          average_rating: question.average_rating.to_f,
          rating_count: question.rating_count,
          students_submitted: question.students_answered.size
      }
    end
  end
end