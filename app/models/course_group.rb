class CourseGroup < ApplicationRecord
has_and_belongs_to_many :instructor
has_and_belongs_to_many :student
has_one :course
end
