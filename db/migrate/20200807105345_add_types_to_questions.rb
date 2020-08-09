class AddTypesToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :is_rating, :boolean
    add_column :questions, :is_text, :boolean
    add_column :questions, :is_boolean, :boolean
    change_column_default :questions, :is_rating, false
    change_column_default :questions, :is_text, false
    change_column_default :questions, :is_boolean, false
  end
end
