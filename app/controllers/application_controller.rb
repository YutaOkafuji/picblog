class ApplicationController < ActionController::Base
      before_action :configure_permitted_parameters, if: :devise_controller?

private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:introduction,:user_image,:user_image_cache, :remove_user_image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:introduction,:user_image,:user_image_cache, :remove_user_image])
    end
end
