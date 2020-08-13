class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.bigint :course_id
      t.bigint :course_group_id
      t.string :type
      t.bigint :student_id

      t.timestamps
    end
  end
end
