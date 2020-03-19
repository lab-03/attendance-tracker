class Course < ApplicationRecord
has_and_belongs_to_many :instructor
has_and_belongs_to_many :student
belongs_to :coursegroup
end
