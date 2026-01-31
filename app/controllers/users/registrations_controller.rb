# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    # GET /users/sign_up
    def new
      super
    end

    # POST /users
    def create
      super
    end

    protected

    # Allow extra parameters during sign up
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: [:email, :password, :password_confirmation]
      )
    end
  end
end
