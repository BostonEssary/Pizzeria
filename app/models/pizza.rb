class Pizza < ApplicationRecord
    has_many :pizza_toppings, dependent: :destroy
    has_many :toppings, through: :pizza_toppings

    validates :toppings, presence: true
    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
