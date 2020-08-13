class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.boolean :correct, default: false
      t.string :text

      t.timestamps
    end
  end
end
