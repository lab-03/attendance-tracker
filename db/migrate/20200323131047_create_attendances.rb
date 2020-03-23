class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.string :course_id
      t.string :course_group_id
      t.string :type
      t.string :student_id

      t.timestamps
    end
  end
end
