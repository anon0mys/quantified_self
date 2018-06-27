FactoryBot.define do
  factory :meal do
    name Faker::Beer.unique.name
  end
end
