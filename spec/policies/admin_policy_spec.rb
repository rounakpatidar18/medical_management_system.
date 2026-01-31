require "rails_helper"

RSpec.describe AdminPolicy do
  subject { described_class }

  let(:admin) { build(:user, :admin) }
  let(:doctor) { build(:user, :doctor) }

  permissions :access? do
    it "allows admin access" do
      expect(subject).to permit(admin, :admin)
    end

    it "denies non-admin access" do
      expect(subject).not_to permit(doctor, :admin)
    end
  end
end
