# == Schema Information
#
# Table name: attendances
#
#  id              :bigint           not null, primary key
#  failure_message :string
#  fr_score        :float
#  lat             :float
#  long            :float
#  verified        :boolean          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_id      :bigint
#  student_id      :bigint
#
# Indexes
#
#  index_attendances_on_session_id  (session_id)
#
class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :verified, :created_at, :updated_at, :session_id, :captured_image, :fr_score, :failure_message
  belongs_to :student, serializer: StudentShortSerializer
  def captured_image
    object.attempted_face&.url
  end
end
