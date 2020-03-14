class CreateAutomatedAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :automated_attendances do |t|
      t.string :Id
      t.string :Course_Id
      t.string :Course_GroupId
      t.string :Type
      t.string :LectureId

      t.timestamps
    end
  end
end
