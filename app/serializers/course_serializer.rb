class CourseSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name
  has_many :course_groups

  has_many :students

  has_many :lecturers

end
