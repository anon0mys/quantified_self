class Api::V1::MealsController < ApiController
  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  end
end
