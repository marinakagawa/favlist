FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "test-pw-1" }
    confirmed_at { Time.now }
  end
end
