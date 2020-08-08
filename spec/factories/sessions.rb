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
FactoryBot.define do
  factory :session do |session|
    lecturer
    duration { "2020-07-30 18:12:24" }
    association :classable, factory: :course
    attachment factory: :attachment
  end
end
