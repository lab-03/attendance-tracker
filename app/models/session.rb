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
class Session < ApplicationRecord
  has_secure_token

  belongs_to :lecturer
  belongs_to :classable, polymorphic: true
  has_many :attendances
  has_one :feed_back, dependent: :destroy
  accepts_nested_attributes_for :feed_back

  has_one :attachment, as: :ownerable, dependent: :destroy
  accepts_nested_attributes_for :attachment, allow_destroy: true

  has_many :interactive_quizzes, class_name: "InteractiveQuiz", dependent: :destroy
  accepts_nested_attributes_for :interactive_quizzes


  validates :lecturer, :classable, presence: true


  def end_session
    return true unless ended_at.nil?
    update!(ended_at: DateTime.now)
    send_feed_back_after_end
  end

  def qr_code
    attachment&.attachment
  end

  def assigned_students
    classable.students
  end

  def assigned_students_user_ids
    assigned_students.map(&method(:student_user_id))
  end

  def attended_students
    attendances.where(verified: true).pluck(:student_id).uniq
  end

  private

  def student_user_id(student)
    student.user.id
  end

  def send_feed_back_after_end
    SendFeedBackJob.perform_async(id)
  end

end
