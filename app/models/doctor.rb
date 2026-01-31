# app/models/doctor.rb
class Doctor < ApplicationRecord
  has_paper_trail

  belongs_to :user

  validates :first_name, :last_name, presence: true
  validates :specialization, presence: true
  validates :medical_license_number, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }

  def full_name
    "#{first_name} #{last_name}"
  end
end