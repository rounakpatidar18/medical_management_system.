# app/models/patient.rb
class Patient < ApplicationRecord
  has_paper_trail

  belongs_to :user

  enum :gender, {
    male: 0,
    female: 1,
    other: 2
  }

  validates :first_name, :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :phone, presence: true

  validate :date_of_birth_cannot_be_future

  scope :active, -> { where(active: true) }

  private

  def date_of_birth_cannot_be_future
    return if date_of_birth.blank?

    if date_of_birth > Date.today
      errors.add(:date_of_birth, "cannot be in the future")
    end
  end
end