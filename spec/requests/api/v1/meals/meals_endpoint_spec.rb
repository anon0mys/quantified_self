require 'rails_helper'

describe 'GET /api/v1/meals' do
  it 'returns a list of meals and the associated foods' do
    meal = create(:meal_with_foods)
    meal_2 = create(:meal_with_foods)

    expected = [{ 'id' => meal.id,
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
               },
               { 'id' => meal_2.id,
                 'name' => meal_2.name,
                 'foods' => [
                   {
                     'id' => meal_2.foods[0].id,
                     'name' => meal_2.foods[0].name,
                     'calories' => meal_2.foods[0].calories
                   },
                   {
                     'id' => meal_2.foods[1].id,
                     'name' => meal_2.foods[1].name,
                     'calories' => meal_2.foods[1].calories
                   },
                   {
                     'id' => meal_2.foods[2].id,
                     'name' => meal_2.foods[2].name,
                     'calories' => meal_2.foods[2].calories
                   }
                 ]
               }]

    get '/api/v1/meals'

    expect(response).to be_successful

    expect(response.body).to eq(expected.to_json)
  end
end
