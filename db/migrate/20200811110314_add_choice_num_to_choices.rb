class AddChoiceNumToChoices < ActiveRecord::Migration[6.0]
  def change
    add_column :choices, :choice_num, :integer
  end
end
