require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  it "rejects duplicate license numbers" do
    license = "LIC123"

    create(:doctor, medical_license_number: license)
    doctor = build(:doctor, medical_license_number: license)

    expect(doctor).not_to be_valid
  end
end
