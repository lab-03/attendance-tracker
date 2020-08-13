class AddReasonToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :failure_message, :string
  end
end
