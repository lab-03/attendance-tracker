class QuestionSerializer < ActiveModel::Serializer

  attributes :id, :text, :is_text, :is_rating, :is_boolean, :ownerable_type, :ownerable_id, :question_type

end