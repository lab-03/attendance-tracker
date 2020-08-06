class RemoveCourseGroupFromAttendance < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    safety_assured do
      remove_column :attendances, :course_group_id
      remove_column :attendances, :course_id
      remove_column :attendances, :type
    end
    add_belongs_to :attendances, :session, index: {algorithm: :concurrently}
    add_column :attendances, :verified, :boolean, null: false
  end
end
