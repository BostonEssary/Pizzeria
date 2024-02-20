require 'rails_helper'

RSpec.describe "Pizzas", type: :request do
  describe "GET /pizzas" do
   it "renders the index template" do
      pepperoni = FactoryBot.create(:topping, name: "Pepperoni")
      pizza = FactoryBot.create(:pizza, name: "Pepperoni", toppings: [pepperoni])
      get pizzas_path
      expect(response).to be_successful
      expect(response.body).to include("Pepperoni")
   end
  end

  describe "GET pizzas/new" do
    
    it "creates a new Pizza and redirects to Pizzas Index" do
      get "/pizzas/new"
      expect(response).to be_successful
    end
  end
end


