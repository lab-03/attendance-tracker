# == Schema Information
#
# Table name: attachments
#
#  id              :bigint           not null, primary key
#  attachment_data :text
#  ownerable_type  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ownerable_id    :integer
#
FactoryBot.define do
  factory :attachment do
    attachment { File.open("#{Rails.root}/spec/files/images/qrcodes/qrcode.png") }
  end
end
