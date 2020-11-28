FactoryBot.define do
  factory :video do
    user
    sequence(:title) { |n| "Video#{n}"}
    sequence(:description) { |n| "Descrição#{n}"}
    clip { }
    thumbnail { }
  end
end

