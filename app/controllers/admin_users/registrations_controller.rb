# app/controllers/admin_users/registrations_controller.rb
# frozen_string_literal: true

class AdminUsers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new  # <- This is crucial
  end

  # POST /admin_users
  def create
    super
    # Ensure default values if user left fields blank
    resource.update(active: true) if resource.active.nil?
    resource.update(role: 1) if resource.role.nil? # default role = Admin
  end

  protected

  # Permit parameters for signup
  def configure_sign_up_params
    # Only allow role and active if you trust the form
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :active])
  end

  # Permit parameters for account update
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :active])
  end

  # Path after signup
  def after_sign_up_path_for(resource)
    admin_root_path
  end

  # Path after inactive signup (not confirmed email)
  def after_inactive_sign_up_path_for(resource)
    new_admin_user_session_path
  end
end
