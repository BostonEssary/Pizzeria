class HomeController < ApplicationController

    def index
        path = nil
        if user_signed_in? == false
            path = new_user_session_path
        elsif current_user.has_role? :chef
            path = pizzas_path
        elsif current_user.has_role? :owner
            path = toppings_path
        end

        redirect_to path
    end
end
