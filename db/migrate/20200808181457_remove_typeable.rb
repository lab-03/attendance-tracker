class RemoveTypeable < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      remove_column :questions, :typeable_id
      remove_column :questions, :typeable_type
    end
  end
end