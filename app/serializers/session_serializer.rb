# == Schema Information
#
# Table name: sessions
#
#  id             :bigint           not null, primary key
#  apply_checks   :boolean          default(TRUE)
#  classable_type :string
#  duration       :time
#  ended_at       :datetime
#  lat            :float
#  long           :float
#  qr_code_base64 :text
#  token          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  classable_id   :integer
#  lecturer_id    :bigint           not null
#
# Indexes
#
#  index_sessions_on_lecturer_id  (lecturer_id)
#  index_sessions_on_token        (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (lecturer_id => lecturers.id)
#
class SessionSerializer < ActiveModel::Serializer
  attributes :id, :token, :qr_code_link, :lat, :long, :apply_checks, :qr_code_base64

  belongs_to :lecturer
  belongs_to :classable, key: :class

  def qr_code_link
    object.qr_code&.url
  end
end
