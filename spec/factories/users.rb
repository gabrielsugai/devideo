FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com"}
    password { 12345678 }

  end
end

