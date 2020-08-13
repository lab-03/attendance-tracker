class AddExpiresAtToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :expires_at, :datetime
    add_column :questions, :question_type, :string
  end
end
