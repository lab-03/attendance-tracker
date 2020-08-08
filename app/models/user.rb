# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  phone                  :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  userable_type          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  student_id             :integer
#  userable_id            :bigint
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  include Devise::Models
  include DeviseTokenAuth::Concerns::ActiveRecordSupport
  include DeviseTokenAuth::Concerns::User
  belongs_to :userable, polymorphic: true, inverse_of: :user, optional: true

  has_many :device_tokens, dependent: :destroy

  before_create :skip_notification
  after_create :confirm_user


  validates :email, :password, presence: true, on: :create


  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable

  def send_confirmation_notification?
    false
  end

  def notification_tokens(device_type = nil)
    (device_type.present? ? device_tokens.by_device_type(device_type) : device_tokens).pluck(:token)
  end

  private

  def skip_notification
    skip_confirmation_notification!
  end

  def confirm_user
    confirm
  end

end
