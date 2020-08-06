class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!
  before_action :set_userable

  before_action :authenticate_user!
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :image])
  end

  private

  def set_userable
    @current_userable = @current_user.userable if @current_user
  end
end
