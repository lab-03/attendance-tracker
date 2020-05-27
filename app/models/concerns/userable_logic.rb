module UserableLogic
  extend ActiveSupport::Concern
  included do
    before_create :create_userable
  end

  def create_userable
    Transcation::Base do

    end
  end
end