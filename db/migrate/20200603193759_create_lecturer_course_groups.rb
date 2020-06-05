class CreateLecturerCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturer_course_groups do |t|
      t.string :lecturer_id
      t.string :course_group_id

      t.timestamps
    end
  end
end
