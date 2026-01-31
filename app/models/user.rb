# app/models/user.rb
class User < ApplicationRecord
  # Authentication
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :registerable

  # Auditing
  has_paper_trail

  # Roles
  enum :role, {
    patient: 0,
    doctor: 1,
    nurse: 2,
    lab_technician: 3,
    pharmacist: 4,
    receptionist: 5,
    accountant: 6,
    admin: 7
  }

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  # Scopes
  scope :active, -> { where(active: true) }
  scope :staff, -> { where.not(role: :patient) }
end
