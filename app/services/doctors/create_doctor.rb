# app/services/doctors/create_doctor.rb
module Doctors
  class CreateDoctor
    def initialize(user:, params:)
      @user = user
      @params = params
    end

    def call
      Doctor.create!(
        @params.merge(user: @user)
      )
    end
  end
end
