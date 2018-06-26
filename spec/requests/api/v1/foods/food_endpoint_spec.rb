require 'rails_helper'

describe 'GET /api/v1/foods/:id' do
  it 'returns the food that corresponds to id' do
    food = create(:food)

    get "/api/v1/foods/#{food.id}"

    expect(response).to be_successful

    expect(response.body).to eq(food.to_json)
  end

  it 'returns a 404 status if food not found' do
    get "/api/v1/foods/200"

    expect(response.status).to eq(404)
  end
end
