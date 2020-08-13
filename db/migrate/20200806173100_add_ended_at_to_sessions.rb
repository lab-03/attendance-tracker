class AddEndedAtToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :ended_at, :datetime
  end
end
