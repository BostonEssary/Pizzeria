require 'rails_helper'

RSpec.describe "Toppings", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "POST /toppings/new" do
    it "Returns 302 if topping is created" do
      post "/toppings", params: {topping: {name: "Bell Pepeprs"}}

      expect(response).to have_http_status(:found)
    end

    it "Returns 422 if topping is given no name so it can't be created" do
      post "/toppings", params: {topping: {name: ""}}

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
