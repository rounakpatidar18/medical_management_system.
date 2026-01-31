require "rails_helper"

RSpec.describe Patient, type: :model do
  it "is invalid with future DOB" do
    patient = build(:patient, date_of_birth: Date.tomorrow)
    expect(patient).not_to be_valid
  end
end