module ClassMethods
  def define_user_accessors
    #We check the user columns to declare them as attributes to delegate

    attributes_to_delegate = %w[email password first_name last_name]
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