FactoryBot.define do
  factory :food do
    name Faker::Beer.unique.name
    calories { rand(100..9999).to_s }
  end
end
