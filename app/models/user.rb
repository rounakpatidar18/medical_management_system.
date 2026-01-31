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
   def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      email
      role
      active
      created_at
      updated_at
      sign_in_count
      current_sign_in_at
      last_sign_in_at
    ]
  end

  # ✅ Optional: allow associations (safe default)
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
