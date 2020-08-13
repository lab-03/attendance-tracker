class CreateDeviceTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :device_tokens do |t|
      t.string :token
      t.belongs_to :user, null: false, foreign_key: true
      t.string :device_type

      t.timestamps
    end
  end
end
