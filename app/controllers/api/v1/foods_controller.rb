class Api::V1::FoodsController < ApiController
  def create
    food = Food.new(food_params)
    if food.save
      render json: food
    else

    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
