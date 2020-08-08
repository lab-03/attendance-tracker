class RemoveTypeableFromQuestions < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      remove_column :questions, :typeable_type, :string
      remove_column :questions, :typeable_id, :integer
    end
  end
end
