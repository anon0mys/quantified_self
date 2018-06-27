require 'rails_helper'

describe Meal do
  context 'attributes' do
    it { should validate_presence_of :name }
  end

  context 'relationships' do
    it { should have_many :meal_foods }
    it { should have_many(:foods).through :meal_foods }
  end
end
