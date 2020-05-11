class AddImageDataToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :image_data, :text
  end
end
