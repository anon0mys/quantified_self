require 'rails_helper'

describe 'POST /api/v1/foods' do
  it 'creates a new food item' do
    food_params = { 'name': 'Pizza', 'calories': '100'}

    post '/api/v1/foods', params: { food: food_params }

    food = Food.last
    expected = {'id' => 1, 'name' => 'Pizza', 'calories' => '100' }

    expect(response).to be_successful

    resp = JSON.parse(response.body)

    expect(resp).to eq(expected)

    expect(food.name).to eq 'Pizza'
    expect(food.calories).to eq '100'
  end

  it 'returns 400 response code if passed invalid attributes' do

    post '/api/v1/foods', params: { food: nil }

    expect(response.status).to eq(400)
  end
end
