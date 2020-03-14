class CreateInstructorCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :instructor_courses do |t|
      t.string :Ins_Id
      t.string :Course_Id

      t.timestamps
    end
  end
end
