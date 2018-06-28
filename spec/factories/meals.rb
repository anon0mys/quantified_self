FactoryBot.define do
  factory :meal do
    name Faker::Beer.unique.name
  end

  factory :meal_with_foods, parent: :meal do
    foods {create_list(:food, 3)}
  end
end
