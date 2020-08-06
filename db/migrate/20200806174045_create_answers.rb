class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :rating
      t.belongs_to :question, null: false, foreign_key: true
      t.references :ownerable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
