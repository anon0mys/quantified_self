class Api::V1::FoodsController < ApiController
  def create
    food = Food.new(food_params)
    if food.save
      render json: food
    else
      render status: 400, json: {}
    end
  end

  def index
    foods = Food.all
    render json: foods
  end

  private

  def food_params
    begin
      params.require(:food).permit(:name, :calories)
    rescue  ActionController::ParameterMissing
      {}
    end
  end
end
