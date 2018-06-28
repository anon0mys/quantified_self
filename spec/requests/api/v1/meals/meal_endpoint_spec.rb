require 'rails_helper'

describe 'GET /api/v1/meals/:meal_id/foods' do
  it 'returns a meal and its associated foods' do
    meal = create(:meal_with_foods)

    expected = { 'id' => meal.id,
                 'name' => meal.name,
                 'foods' => [
                   {
                     'id' => meal.foods[0].id,
                     'name' => meal.foods[0].name,
                     'calories' => meal.foods[0].calories
                   },
                   {
                     'id' => meal.foods[1].id,
                     'name' => meal.foods[1].name,
                     'calories' => meal.foods[1].calories
                   },
                   {
                     'id' => meal.foods[2].id,
                     'name' => meal.foods[2].name,
                     'calories' => meal.foods[2].calories
                   }
                 ]
               }

    get "/api/v1/meals/#{meal.id}/foods"

    expect(response).to be_successful

    expect(response.body).to eq(expected.to_json)
  end

  it 'returns 404 if no meal is found' do
    get "/api/v1/meals/20/foods"

    expect(response.status).to eq(404)
  end
end
