class CreateFeedBacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_backs do |t|
      t.belongs_to :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
