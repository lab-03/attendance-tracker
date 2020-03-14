class CreateCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :course_groups do |t|
      t.string :Course_Id
      t.string :Group_Id

      t.timestamps
    end
  end
end
