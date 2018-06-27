require 'rails_helper'

describe 'POST /api/v1/meals/:meal_id/foods/:id' do
  it 'creates a new meal-food relationship' do
    meal = create(:meal)
    food = create(:food)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expected = { "message": "Successfully added FOODNAME to MEALNAME" }

    expect(response.status).to eq(201)
    expect(response.body).to eq(expected.to_json)

    expect(meal.foods).to include(food)
  end
end
