class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.integer :ownerable_id
      t.string :ownerable_type
      t.text :attachment_data
      t.timestamps
    end
  end
end
