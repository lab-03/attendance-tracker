class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!, unless: :not_sign_in
  before_action :set_userable


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :image])
  end

  private

  def not_sign_in
    "/auth/sign_in".casecmp(request&.path).eql?(0)
  end

  def set_userable
    @current_userable = @current_user.userable if @current_user
  end
end
