class ToppingsController < ApplicationController

    def index
        @toppings = Topping.all
    end

    def create
        @topping = Topping.new(allowed_topping_params)

        if @topping.save
            flash[:success] = "Topping was added"
            redirect_to toppings_path
        else
            flash.now[:error] = "Error: Topping was not added"
            render :new, status: :unprocessable_entity
        end
    end

    def new
        @topping = Topping.new
    end

    private

    def allowed_topping_params
        params.require(:topping).permit(:name)
    end
end
