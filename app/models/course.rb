class Course < ApplicationRecord
has_and_belongs_to_many :Instructor
has_and_belongs_to_many :Student
belongs_to :Course_Group
end
