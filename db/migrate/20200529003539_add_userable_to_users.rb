class AddUserableToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :userable_id, :bigint
    add_column :users, :userable_type, :string
  end
end
