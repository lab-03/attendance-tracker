module ClassMethods
  def define_user_accessors
    #We check the user columns to declare them as attributes to delegate
    all_attributes = User.columns.map(&:name)
    ignored_attributes = [ 'password_confirmation', 'encrypted_password',
                          "created_at", "updated_at", "id", "userable_type", "userable_id",
                          "provider",
                          "uid",
                          "reset_password_token",
                          "reset_password_sent_at",
                          "allow_password_change",
                          "remember_created_at",
                          "confirmation_token",
                          "confirmed_at",
                          "confirmation_sent_at",
                          "unconfirmed_email",
                          "failed_attempts",
                          "unlock_token",
                          "locked_at",
                          "tokens",
                          "sign_in_count",
                          "current_sign_in_at",
                          "last_sign_in_at",
                          "current_sign_in_ip",
                          "last_sign_in_ip"
    ]
    attributes_to_delegate = all_attributes - ignored_attributes
    #User method delegation
    attributes_to_delegate.each do |attrib|
      class_eval <<-RUBY
          def #{attrib}
            user.#{attrib}
          end

          def #{attrib}=(value)
            self.user.#{attrib} = value
          end

          def #{attrib}?
            self.user.#{attrib}?
          end
      RUBY
    end
  end
end