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

  def show
    food = Food.find(params[:id])
    render json: food
  end

  def update
    food = Food.find(params[:id])
    if food_params.empty?
      render status: 400, json: {}
    elsif food.update(food_params)
      render json: food
    end
  end

  def destroy
    food = Food.find(params[:id])
    if food.destroy
      render status: 204, json: {}
    end
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
