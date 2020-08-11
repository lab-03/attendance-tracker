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
class Attendance < ApplicationRecord

 self.ignored_columns = ["course_group_id"]

 belongs_to :session
 belongs_to :student

 has_one :attachment, as: :ownerable, dependent: :destroy
 accepts_nested_attributes_for :attachment
 # validates :course ,presence: true
 validates :student, :session ,presence: true

 def classable
  session&.classable
 end

 def attempted_face
  attachment&.attachment
 end
end
