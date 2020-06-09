class AddImageToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :image_data, :text
    safety_assured { remove_column :users, :image, :text }
  end
end
