require 'rails_helper'

describe 'GET /api/v1/foods' do
  it 'returns a list of all foods' do
    foods = create_list(:food, 10)

    get '/api/v1/foods'

    expect(response).to be_successful

    list = foods.to_json

    expect(response.body).to eq(list)

  end
end
