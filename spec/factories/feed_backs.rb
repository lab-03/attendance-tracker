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
FactoryBot.define do
  factory :feed_back do
    session { nil }
  end
end
