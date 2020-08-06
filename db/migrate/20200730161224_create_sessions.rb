class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :token
      t.belongs_to :lecturer, null: false, foreign_key: true
      t.integer :classable_id
      t.string :classable_type
      t.time :duration
      t.timestamps
    end
  end
end
