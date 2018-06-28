class Api::V1::Meals::FoodsController < ApiController
  def create
    food = Food.find(params[:id])
    meal = Meal.find(params[:meal_id])
    meal.foods << food
    render status: 201, json: { "message": "Successfully added #{food.name} to #{meal.name}" }
  end

  def destroy
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    relation = MealFood.where(meal: meal, food: food).first
    if relation.destroy
      render json: { 'message' => "Successfully removed #{food.name} from #{meal.name}" }
    end
  end
end
