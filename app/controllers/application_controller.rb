class ApplicationController < ActionController::Base
  before_action :logutil, :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username])
    end

    def logutil
      @clog = Rails.application.config.customlogger
    end
end
