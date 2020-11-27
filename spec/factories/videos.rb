require 'rails_helper'

FactoryBot.define do
  factory :video do
    sequence(:title) { |n| "Video#{n}"}
    sequence(:description) { |n| "Descrição#{n}"}
    clip { }
    thumbnail { }
  end
end

