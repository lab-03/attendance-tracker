class CreateSession < CommandBase
  def call(session, lat = 12 , long = 13, apply_checks = true)
    ActiveRecord::Base.transaction do
      session.save!
      qr_data = AttendanceVerifier.create_qr_code({hash: session.token, lat: lat, long: long, apply_checks: apply_checks})
      session.attachment_attributes = {attachment_data_uri: qr_data}
      session.save!
    end
    success(session, 2010)
  end
end