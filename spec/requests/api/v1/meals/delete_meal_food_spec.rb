require 'rails_helper'

describe 'DELETE /api/v1/meals/:meal_id/foods/:id' do
  it 'removes a food from the identified meal' do
    meal = create(:meal_with_foods)
    food_tbd = meal.foods.first

    expect(meal.foods.count).to eq(3)

    expected = { 'message' => "Successfully removed #{food_tbd.name} from #{meal.name}" }

    delete "/api/v1/meals/#{meal.id}/foods/#{food_tbd.id}"

    expect(response.body).to eq(expected.to_json)

    expect(meal.foods.count).to eq(2)

    updated = Meal.find(meal.id)

    expect(updated.foods).to_not include(food_tbd)
  end
end
