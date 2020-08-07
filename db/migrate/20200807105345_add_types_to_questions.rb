class AddTypesToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :is_rating, :boolean, default: false
    add_column :questions, :is_text, :boolean, default: false
    add_column :questions, :is_boolean, :boolean, default: false
  end
end
