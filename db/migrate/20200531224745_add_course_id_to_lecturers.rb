class AddCourseIdToLecturers < ActiveRecord::Migration[6.0]
  def change
    add_column :lecturers, :course_id, :string
  end
end
