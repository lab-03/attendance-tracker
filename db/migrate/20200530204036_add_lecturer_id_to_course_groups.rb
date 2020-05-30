class AddLecturerIdToCourseGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :course_groups, :lecturer_id, :string
  end
end
