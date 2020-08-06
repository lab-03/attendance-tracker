# == Schema Information
#
# Table name: sessions
#
#  id             :bigint           not null, primary key
#  classable_type :string
#  duration       :time
#  ended_at       :datetime
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
class Session < ApplicationRecord
  has_secure_token

  belongs_to :lecturer
  belongs_to :classable, polymorphic: true
  has_many :attendances
  has_one :feed_back

  has_one :attachment, as: :ownerable
  accepts_nested_attributes_for :attachment, allow_destroy: true

  validates :lecturer, :classable, presence: true

  after_save :send_feed_back_after_end, if: :ended_at?

  def end_session
    update(ended_at: DateTime.now)
  end

  def qr_code
    attachment&.attachment
  end

  def assigned_students
    classable.students
  end

  private

  def send_feed_back_after_end
    FeedBack.create!(session: self)

    true # send logic should be here
  end

end
