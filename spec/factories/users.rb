FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "Password@123" }
    active { true }

    trait :admin do
      role { :admin }
    end

    trait :doctor do
      role { :doctor }
    end

    trait :patient do
      role { :patient }
    end
  end
end