class CreateStudentCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :student_course_groups do |t|
      t.string :Student_Id
      t.string :Course_Id

      t.timestamps
    end
  end
end
