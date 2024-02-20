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

  describe "GET /pizzas/new" do
    
    it "goes renders new page" do
      get "/pizzas/new"
      expect(response).to be_successful
    end
  end

  describe "POST /pizzas" do
    
    it "Creates a new Pizza" do
      t1 = FactoryBot.create(:topping)
      post pizzas_path, params: {pizza: {name: "Test", topping_ids: [t1.id]} } 

      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /pizzas/:id/edit" do
    it "Gets the Edit page for the pizza" do
      pepperoni = FactoryBot.create(:topping, name: "Pepperoni")
      pizza = FactoryBot.create(:pizza, name: "Pepperoni", toppings: [pepperoni])

      get edit_pizza_path(pizza.id)
      expect(response).to be_successful

      expect(response.body).to include("Pepperoni")
    end

    it "Will update the pizza information" do
      pepperoni = FactoryBot.create(:topping, name: "Pepperoni")
      pizza = FactoryBot.create(:pizza, name: "Pepperoni", toppings: [pepperoni])

      patch pizza_path(pizza.id), params: {pizza: {name: "Test"} } 

      expect(pizza.name).to eq("Pepperoni")
      expect(response).to have_http_status(:found)
      pizza.reload
      expect(pizza.name).to eq("Test")
    end
  end

  describe "DELETE /pizza/:id" do
    it "Will delete the pizza with the given id" do
      pepperoni = FactoryBot.create(:topping, name: "Pepperoni")
      pizza = FactoryBot.create(:pizza, name: "Pepperoni", toppings: [pepperoni])
      size = Pizza.count

      delete pizza_path(pizza.id)
      expect(response).to have_http_status(:found)
      expect(Pizza.count).to eq(size-1)
    end
  end
end


