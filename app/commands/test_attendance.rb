class TestAttendance < CommandBase
  def call(student)
    session = Session.find_by_token("test")
    student_verification = StudentVerifier.verify(verification_params)
    attendance = session.attendances.new(student: student, verified: true)
    attendance.verified = student_verification["status"] == "success"
    if attendance.verified
      attendance.fr_score = student_verification["data"]["FRScore"] if student_verification["data"]
      StudentVerifier::new_attendee(session, student, attendance.fr_score)
    else
      attendance.failure_message = student_verification["message"]
    end
    attendance.save!
    success(attendance, 200)
  end


  def verification_params
    {hash: "test", latitude: 1.1, longitude: 2.2}
  end

end