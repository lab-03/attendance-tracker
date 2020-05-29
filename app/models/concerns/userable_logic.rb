module UserableLogic
  extend ActiveSupport::Concern

  def self.included(base)
    base.has_one :user, as: :userable, :dependent => :destroy, autosave: true, validate: true
    base.extend ClassMethods
    base.define_user_accessors
    base.auto_build :user
  end

end