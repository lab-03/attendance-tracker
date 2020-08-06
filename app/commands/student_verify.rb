class StudentVerify < CommandBase
  def call(session, student, face_captured)
    attendance = find_or_init_attendance(session, student, face_captured)
    return success(attendance) if attendance.persisted?
    ActiveRecord::Base.transaction do
      attendance.save!
      attendance.verified = FaceRecognition::same_person(student.image_url, attendance.attempted_face&.url)
      attendance.save!
    end
    success(attendance, 200)
  end

  private

  def find_or_init_attendance(session, student, face_captured)
    Attendance.where(student_id: student.id, session_id: session.id, verified: true).first || Attendance.new(attendance_params(session, student, face_captured))
  end

  def attendance_params(session, student, face_captured)
    {session: session,
     student: student,
     verified: false,
     attachment_attributes: {attachment: face_captured}}
  end
end