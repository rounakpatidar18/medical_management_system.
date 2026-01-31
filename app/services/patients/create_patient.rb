# app/services/patients/create_patient.rb
module Patients
  class CreatePatient
    def initialize(user:, params:)
      @user = user
      @params = params
    end

    def call
      Patient.create!(
        @params.merge(user: @user)
      )
    end
  end
end
