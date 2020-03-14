class CourseStudent < ApplicationRecord
belongs_to :Student
belongs_to :Course
end
