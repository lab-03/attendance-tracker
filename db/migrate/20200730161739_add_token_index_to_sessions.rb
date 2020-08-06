class AddTokenIndexToSessions < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :sessions, :token, unique: true, algorithm: :concurrently
  end

end
