class StudentCourseGroup < ApplicationRecord
belongs_to :Student
belongs_to :CourseGroup
end
