class Api::V1::Meals::FoodsController < ApiController
  def create
    food = Food.find(params[:id])
    meal = Meal.find(params[:meal_id])
    meal.foods << food
    render json: { "message": "Successfully added #{food.name} to #{meal.name}" }
  end
end
