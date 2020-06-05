class CreateCourseStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :course_students do |t|
      t.string :student_id
      t.string :course_id

      t.timestamps
    end
  end
end
