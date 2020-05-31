class BackFillTrackAbleToUsers < ActiveRecord::Migration[6.0]
  def change
    User.unscoped.in_batches do |relation|
      relation.update_all sign_in_count: 0
      sleep(0.01)
    end
  end
end
