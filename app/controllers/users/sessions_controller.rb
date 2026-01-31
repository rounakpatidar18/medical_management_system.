# app/controllers/users/sessions_controller.rb
module Users
  class SessionsController < Devise::SessionsController
    # GET /users/sign_in
    def new
      super
    end

    # POST /users/sign_in
    def create
      super
    end

    # DELETE /users/sign_out
    def destroy
      super
    end
  end
end
