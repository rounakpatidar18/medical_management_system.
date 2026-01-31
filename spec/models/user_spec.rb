require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = build(:user, role: :admin)
      expect(user).to be_valid
    end

    it "is invalid without email" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without role" do
      user = build(:user, role: nil)
      expect(user).not_to be_valid
    end

    it "enforces unique email" do
      create(:user, email: "test@example.com")
      user = build(:user, email: "test@example.com")
      expect(user).not_to be_valid
    end
  end

  describe "enums" do
    it "defines correct roles" do
      expect(User.roles.keys).to include(
        "admin",
        "doctor",
        "nurse",
        "lab_technician",
        "pharmacist",
        "receptionist",
        "accountant",
        "patient"
      )
    end
  end

  describe "scopes" do
    it "returns only active users" do
      active_user = create(:user, active: true)
      inactive_user = create(:user, active: false)

      expect(User.active).to include(active_user)
      expect(User.active).not_to include(inactive_user)
    end

    it "returns only staff users" do
      doctor = create(:user, :doctor)
      patient = create(:user, :patient)

      expect(User.staff).to include(doctor)
      expect(User.staff).not_to include(patient)
    end
  end

  describe "auditing" do
    it "creates a paper trail version on update" do
      user = create(:user, :admin)
      expect {
        user.update!(role: :doctor)
      }.to change { user.versions.count }.by(1)
    end
  end
end
