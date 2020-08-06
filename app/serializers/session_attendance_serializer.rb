class SessionAttendanceSerializer < ActiveModel::Serializer
  attributes :id, :token, :qr_code_link, :attendances

  belongs_to :lecturer
  belongs_to :classable, key: :class
  # has_many :attendances, serializer: AttendanceSerializer

  def attendances
    object.attendances.map do |attendance|
      AttendanceSerializer.new(attendance)
    end
  end

  def qr_code_link
    object.qr_code&.url
  end
end