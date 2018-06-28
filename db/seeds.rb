meals = %w[Breakfast Snacks Lunch Dinner]

meals.each do |meal|
  Meal.create({name: meal})
end
