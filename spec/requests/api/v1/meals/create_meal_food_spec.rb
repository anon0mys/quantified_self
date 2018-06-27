require 'rails_helper'

describe 'POST /api/v1/meals/:meal_id/foods/:id' do
  it 'creates a new meal-food relationship' do
    meal = create(:meal)
    food = create(:food)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expected = { "message": "Successfully added #{food.name} to #{meal.name}" }

    expect(response.status).to eq(201)
    expect(response.body).to eq(expected.to_json)

    expect(meal.foods).to include(food)
  end

  it 'returns 404 if food not found' do
    meal = create(:meal)

    post "/api/v1/meals/#{meal.id}/foods/200"

    expect(response.status).to eq(404)
  end

  it 'returns 404 if meal not found' do
    food = create(:food)

    post "/api/v1/meals/200/foods/#{food.id}"

    expect(response.status).to eq(404)
  end
end
