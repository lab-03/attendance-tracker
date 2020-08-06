class CreateSession < CommandBase
  def call(session, lat = 12 , long = 13)
    ActiveRecord::Base.transaction do
      session.save!
      qr_data = AttendanceVerifier.create_qr_code({hash: session.token, lat: lat, long: long})
      session.attachment_attributes = {attachment_data_uri: qr_data}
      session.save!
    end
    success(session, 2010)
  end
end