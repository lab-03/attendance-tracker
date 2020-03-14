class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :Name
      t.string :Password

      t.timestamps
    end
  end
end
