require 'rails_helper'

describe 'GET /api/v1/foods/:id' do
  it 'returns the food that corresponds to id' do
    food = create(:food)

    get "/api/v1/foods/#{food.id}"

    expect(response).to be_successful

    expect(response.body).to eq(food.to_json)
  end
end
