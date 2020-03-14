class CreateInstructorCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :instructor_course_groups do |t|
      t.string :Ins_Id
      t.string :Group_Id

      t.timestamps
    end
  end
end
