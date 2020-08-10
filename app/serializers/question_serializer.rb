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
class QuestionSerializer < ActiveModel::Serializer

  attributes :id, :text, :is_text, :is_rating, :is_boolean, :ownerable_type, :ownerable_id, :question_type

end
