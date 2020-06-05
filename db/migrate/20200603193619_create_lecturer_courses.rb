class CreateLecturerCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturer_courses do |t|
      t.string :lecturer_id
      t.string :course_id

      t.timestamps
    end
  end
end
