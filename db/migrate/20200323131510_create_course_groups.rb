class CreateCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :course_groups do |t|
      t.string :course_id
      t.string :group_id

      t.timestamps
    end
  end
end
