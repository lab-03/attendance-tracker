class CreateCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :course_groups do |t|
      t.bigint :course_id
      t.bigint :group_id

      t.timestamps
    end
  end
end
