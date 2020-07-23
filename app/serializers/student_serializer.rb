class StudentSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :image , :email,  :user_id
  has_many :course_groups
  has_many :courses
end
