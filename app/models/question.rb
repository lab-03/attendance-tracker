# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  expires_at     :datetime
#  is_boolean     :boolean          default(FALSE)
#  is_rating      :boolean          default(FALSE)
#  is_text        :boolean          default(FALSE)
#  ownerable_type :string
#  question_type  :string
#  text           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ownerable_id   :integer
#
class Question < ApplicationRecord
  self.ignored_columns = %w[typeable_type typeable_id]

  belongs_to :ownerable, polymorphic: true, optional: true
  has_many :answers
  has_many :choices
  accepts_nested_attributes_for :choices

  enum question_type: {feed_back: :feed_back, interactive: :interactive}

  validates :text, presence: true

  scope :by_type, ->(type) { where(question_type: type) }
  scope :by_typeable, ->(typeable) { where(typeable: typeable) }

  def session
    ownerable&.session
  end
end
