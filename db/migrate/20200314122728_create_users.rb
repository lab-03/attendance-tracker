class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :Id
      t.string :Type

      t.timestamps
    end
  end
end
