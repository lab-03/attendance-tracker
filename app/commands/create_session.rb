class CreateSession < CommandBase
  def call(session)
    ActiveRecord::Base.transaction do
      session.save!
      qr_data = AttendanceVerifier.create_qr_code({hash: session.token, lat: session.lat, long: session.long, apply_checks: session.apply_checks})
      session.qr_code_base64 = qr_data
      session.attachment_attributes = {attachment_data_uri: qr_data}
      session.save!
    end
    success(session, 2010)
  end
end