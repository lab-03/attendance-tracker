class AddCourseGroupIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :course_group_id, :string
  end
end
