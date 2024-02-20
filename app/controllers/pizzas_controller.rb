class PizzasController < ApplicationController

    def index
        @pizzas = Pizza.all
    end
    
    def create
        @pizza = Pizza.new(allowed_pizza_params)
    
        if @pizza.save
            flash[:success] = "Pizza was added"
            redirect_to pizzas_path
        else
            flash.now[:error] = "Error: Pizza was not added"
            render :new, status: :unprocessable_entity
        end
    end

    def new
        @pizza = Pizza.new
    end

    def edit
        @pizza = Pizza.find(params[:id])
    end

    def update
        @pizza = Pizza.find(params[:id])

        if @pizza.update(allowed_pizza_params)
            flash[:success] = "Pizza was updated"
            redirect_to pizzas_path
        else
            flash.now[:error] = "Error: Pizza was not added"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @pizza = Pizza.find(params[:id])
        @pizza.destroy

        redirect_to pizzas_path
    end


    private

    def allowed_pizza_params
        params.require(:pizza).permit(:name, topping_ids: [])
    end
end
