# == Schema Information
#
# Table name: sessions
#
#  id             :bigint           not null, primary key
#  classable_type :string
#  duration       :time
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
  attributes :id, :token, :qr_code_link

  belongs_to :lecturer
  belongs_to :classable, key: :class

  def qr_code_link
    object.qr_code&.url
  end
end
