class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, only: [:update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
  end
end
