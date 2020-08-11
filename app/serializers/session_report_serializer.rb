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
    attended_students =  object.attended_students.size
    unattended_students = (total_students - attended_students)
    {
        total_students: total_students,
        attended_students: attended_students,
        unattended_students: unattended_students
    }
  end

  def participants
    {
        total_students: 12,
        total_right_answers: 9
    }
  end

  def feedback
    questions = object.feed_back&.questions
    return unless questions
    questions.map do |question|
      {
          text: question.text,
          rating: question.average_rating.to_f,
          students_submitted: question.students_answered.size
      }
    end
  end
end