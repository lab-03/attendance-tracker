class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.string :Course_Id
      t.string :Course_GroupId
      t.string :Type
      t.string :Student_Id

      t.timestamps
    end
  end
end
