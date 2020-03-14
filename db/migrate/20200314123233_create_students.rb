class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :Name
      t.string :Password
      t.string :Image

      t.timestamps
    end
  end
end
