class ApplicationController < ActionController::Base
  before_action :authenticate_dog_owner!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when DogOwner
      root_path
    when Administrator
      admin_dog_categories_path
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :nickname, :postal_code, :address, :phone_number])
  end
end
