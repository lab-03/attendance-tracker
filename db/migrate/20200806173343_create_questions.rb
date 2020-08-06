class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :typeable_type
      t.integer :typeable_id
      t.string :ownerable_type
      t.integer :ownerable_id

      t.timestamps
    end
  end
end
