class FoodsController < ApplicationController
    def index
        foods = Food.all
        render json: foods
    end

    def create
      food = Food.create(food_params)
    if food.valid?
      render json: food
    else
      render json: food.errors, status: 422
    end
  end

    def update
      food = Food.find(params[:id])
      food.update(food_params)
      render json: food
    end

  private
    def food_params
        params.require(:food).permit(:dishname, :genre, :category, :image)
    end

end
