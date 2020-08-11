# == Schema Information
#
# Table name: feed_backs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :bigint           not null
#
# Indexes
#
#  index_feed_backs_on_session_id  (session_id)
#
# Foreign Keys
#
#  fk_rails_...  (session_id => sessions.id)
#
class FeedBack < ApplicationRecord
  belongs_to :session, optional: false
  has_many :questions, as: :ownerable
  accepts_nested_attributes_for :questions, allow_destroy: true



  def notification_json
    {
        notification: {
            title: "You have got some feed back questions to answer",
            body: "Open this notification to answer some quick questions"
        },
        data: {
            type: "feed_back",
            id: self.id,
            question_ids: question_ids
        }
    }
  end
end
