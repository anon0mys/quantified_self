require 'rails_helper'

describe 'DELETE /api/v1/foods/:id' do
  it 'deletes a food record' do
    create_list(:food, 10)
    food = create(:food)

    expect(Food.count).to eq(11)

    delete "/api/v1/foods/#{food.id}"

    expect(response.status).to eq(204)
    expect(Food.count).to eq(10)
  end

  it 'returns 404 if food not found' do
    delete '/api/v1/foods/200'

    expect(response.status).to eq(404)
  end
end
