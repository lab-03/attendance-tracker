class StudentVerify < CommandBase
  def call(session, student, params)
    attendance = find_or_init_attendance(session, student, params[:captured_face])
    return success(attendance) if attendance.persisted?
    ActiveRecord::Base.transaction do
      attendance.save!
      # attendance.verified = FaceRecognition::same_person(student.image_url, attendance.attempted_face&.url)
      params[:captured_face] = attendance.attempted_face&.url
      student_verification = StudentVerify::verify(verify_params(session, student, params))
      attendance.verified = student_verification["status"] == "success"
      attendance.fr_score = student_verification["data"]["FRScore"] if attendance.verified
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

  def verify_params(session, student, params)
    base_hash = {
        hash: session.token,
        latitude: params[:lat],
        longitude: params[:long],
    }
    if params[:captured_face].present?
      base_hash.merge!({captured_face: params[:captured_face], original_face: student.image_url})
    else
      base_hash
    end
  end
end