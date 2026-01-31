FactoryBot.define do
  factory :patient do
    association :user
    first_name { "John" }
    last_name  { "Doe" }
    date_of_birth { 30.years.ago }
    gender { :male }
    phone { "9999999999" }
    active { true }
  end
end