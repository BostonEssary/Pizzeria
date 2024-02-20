# == Schema Information
#
# Table name: toppings
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Topping < ApplicationRecord
    has_many :pizza_toppings, dependent: :destroy
    has_many :pizzas, through: :pizza_toppings

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
