class AddUserIdToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :user_id, :bigint
    add_column :lecturers, :user_id, :bigint
  end
end
