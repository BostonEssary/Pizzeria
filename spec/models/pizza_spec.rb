require 'rails_helper'

RSpec.describe Pizza, type: :model do
  it "will have a default name of Default" do
    pizza = create(:pizza)

    expect(pizza.name).to eq("Default Pizza")
  end

  it "will have a name of Pepperoni if given the name Pepperoni" do
    pizza = create(:pizza, name: "Pepperoni Pizza")

    expect(pizza.name).to eq("Pepperoni Pizza")
  end

  it "will not let two toppings of the same name be added to the db" do
    p1 = create(:pizza, name: "Pepperoni Pizza")

    expect {create(:pizza, name: "Pepperoni Pizza") }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
