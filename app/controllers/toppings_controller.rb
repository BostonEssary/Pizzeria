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

    def edit
        @topping = Topping.find(params[:id])
    end

    def update
        @topping = Topping.find(params[:id])

        if @topping.update(allowed_topping_params)
            flash[:success] = "Topping was updated"
            redirect_to toppings_path
        else
            flash.now[:error] = "Error: Topping was not added"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @topping = Topping.find(params[:id])
        @topping.destroy

        redirect_to toppings_path
    end

    private

    def allowed_topping_params
        params.require(:topping).permit(:name)
    end
end
