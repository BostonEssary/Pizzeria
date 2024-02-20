FactoryBot.define do
  factory :pizza do
    name { "Default Pizza" }
    toppings { [FactoryBot.create(:topping)] }
  end
end
