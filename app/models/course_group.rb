class CourseGroup < ApplicationRecord
has_and_belongs_to_many :Instructor
has_and_belongs_to_many :Student
has_one :Course
end
