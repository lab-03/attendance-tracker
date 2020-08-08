class AddMissingAttributesToSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :apply_checks, :boolean, default: true
    add_column :sessions, :lat, :float
    add_column :sessions, :long, :float
  end
end
