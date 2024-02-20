# == Schema Information
#
# Table name: toppings
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Topping, type: :model do
  it "will have a default name of Default" do
    topping = create(:topping)

    expect(topping.name).to eq("Default")
  end

  it "will have a name of Pepperoni if given the name Pepperoni" do
    topping = create(:topping, name: "Pepperoni")

    expect(topping.name).to eq("Pepperoni")
  end

  it "will not let two toppings of the same name be added to the db" do
    t1 = create(:topping, name: "Pepperoni")

    expect {create(:topping, name: "Pepperoni") }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
