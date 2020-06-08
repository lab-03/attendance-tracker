class CreateCourseGroupStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :course_group_students do |t|
      t.bigint :student_id
      t.bigint :course_group_id
      
      t.timestamps
    end
  end
end
