class AddMissingAttributesToSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :apply_checks, :boolean
    add_column :sessions, :lat, :float
    add_column :sessions, :long, :float
    change_column_default :sessions, :apply_checks, true
  end
end
