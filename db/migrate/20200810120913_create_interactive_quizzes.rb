class CreateInteractiveQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :interactive_quizzes do |t|
      t.string :name
      t.belongs_to :session, null: false, foreign_key: true
      t.timestamp :ended_at

      t.timestamps
    end
  end
end
