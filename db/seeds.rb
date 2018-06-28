meals = %w[Breakfast Lunch Dinner Snacks]

meals.each do |meal|
  Meal.create({name: meal})
end
