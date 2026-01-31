FactoryBot.define do
  factory :doctor do
    association :user, factory: [:user, :doctor]
    first_name { "Alice" }
    last_name { "Smith" }
    specialization { "Cardiology" }
    medical_license_number { SecureRandom.hex(6) }
  end
end
