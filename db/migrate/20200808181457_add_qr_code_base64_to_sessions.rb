class AddQrCodeBase64ToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :qr_code_base64, :text
  end
end
