class AddChoiceToAnswer < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :answers, :choice, null: true, index: {algorithm: :concurrently}
  end
end
