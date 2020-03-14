class CreateCourseStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :course_students do |t|
      t.string :Student_Id
      t.string :Course_Id

      t.timestamps
    end
  end
end
