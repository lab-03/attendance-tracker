class AddQrCodeBase64ToSessions < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_column :sessions, :qr_code_base64, :text
  end

  def up
    Session.unscoped.in_batches do |relation|
      relation.update_all apply_checks: true
      sleep(0.01)
    end
  end
end
