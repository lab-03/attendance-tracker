class CreateLecturerCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturer_course_groups do |t|
      t.bigint :lecturer_id
      t.bigint :course_group_id

      t.timestamps
    end
  end
end
