class LecturerSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :first_name, :last_name, :user_id, :email
  has_many :courses
  has_many :course_groups
end
