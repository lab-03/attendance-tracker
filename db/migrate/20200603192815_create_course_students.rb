class CreateCourseStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :course_students do |t|
      t.bigint :student_id
      t.bigint :course_id

      t.timestamps
    end
  end
end
