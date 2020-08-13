class CreateLecturerCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturer_courses do |t|
      t.bigint :lecturer_id
      t.bigint :course_id

      t.timestamps
    end
  end
end
