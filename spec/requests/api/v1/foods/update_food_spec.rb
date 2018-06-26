require 'rails_helper'

describe 'PATCH /api/v1/foods/:id' do
  it 'updates a food item' do
    food = create(:food)
    update_params = { 'name': 'Updated', 'calories': '1'}

    patch "/api/v1/foods/#{food.id}", params: { food: update_params }

    expect(response).to be_successful

    expected = {'id' => food.id, 'name' => 'Updated', 'calories' => '1' }

    expect(response.body).to eq(expected.to_json)
  end

  it 'returns 404 if food does not exist' do
    patch '/api/v1/foods/200', params: { food: {}}

    expect(response.status).to eq(404)
  end

  it 'returns 400 if food is not updated' do
    food = create(:food)

    patch "/api/v1/foods/#{food.id}", params: { food: {'bad_attr': 'not real'}}

    expect(response.status).to eq(400)
  end
end
