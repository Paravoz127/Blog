module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def update_resource(resource, params)
      resource.update_attributes(params)
    end

    def account_update_params
      params = devise_parameter_sanitizer.sanitize(:account_update)

      params.except(:avatar) if avatar_blank?(params)

      if passwords_blank?(params)
        params.except(:password, :password_confirmation)
      else
        params
      end
    end

    def passwords_blank?(params)
      params[:password].blank? && params[:password_confirmation].blank?
    end

    def avatar_blank?(params)
      params[:avatar].blank?
    end
  end
end
