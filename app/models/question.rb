# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  expires_at     :datetime
#  ownerable_type :string
#  question_type  :string
#  text           :string
#  typeable_type  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ownerable_id   :integer
#  typeable_id    :integer
#
class Question < ApplicationRecord
  belongs_to :typeable, polymorphic: true
  belongs_to :ownerable, polymorphic: true
  has_many :answers

  enum question_type: {feed_back: :feed_back, interactive: :interactive}

  validates :text, presence: true

  scope :by_type, ->(type) { where(question_type: type) }
  scope :by_typeable, ->(typeable) { where(typeable: typeable) }
end
