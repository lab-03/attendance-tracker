class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :Id
      t.string :Name

      t.timestamps
    end
  end
end
