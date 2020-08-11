class AddFaceScoreToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :fr_score, :float
  end
end
