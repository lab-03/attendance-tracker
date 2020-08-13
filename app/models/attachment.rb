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
class Attachment < ApplicationRecord
  include ImageUploader::Attachment(:attachment)

  belongs_to :ownerable, polymorphic: true, optional: true


end
