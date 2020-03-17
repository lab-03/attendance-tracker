class Student < ApplicationRecord
has_and_belongs_to_many :Course
has_and_belongs_to_many :CourseGroup
end
