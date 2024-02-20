require 'rails_helper'

RSpec.describe "Toppings", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "POST /toppings" do
    it "Returns 302 if topping is created" do
      post "/toppings", params: {topping: {name: "Bell Pepeprs"}}

      expect(response).to have_http_status(:found)
    end

    it "Returns 422 if topping is given no name so it can't be created" do
      post "/toppings", params: {topping: {name: ""}}

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET /toppings/:id/edit" do
    it "Gets the Edit page for the topping" do
      topping = FactoryBot.create(:topping, name: "Pepperoni")

      get edit_topping_path(topping.id)
      expect(response).to be_successful

      expect(response.body).to include("Pepperoni")
    end

    it "Will update the topping information" do
      topping = FactoryBot.create(:topping, name: "Pepperoni")

      patch topping_path(topping.id), params: {topping: {name: "Test"} } 

      expect(topping.name).to eq("Pepperoni")
      expect(response).to have_http_status(:found)
      topping.reload
      expect(topping.name).to eq("Test")
    end
  end


  describe "DELETE /topping/:id" do
    it "Will delete the topping with the given id" do
      topping = FactoryBot.create(:topping, name: "Pepperoni")
      size = Topping.count

      delete topping_path(topping.id)
      expect(response).to have_http_status(:found)
      expect(Topping.count).to eq(size-1)
    end
  end
end
