class AddLocationToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :lat, :float
    add_column :attendances, :long, :float
  end
end
