# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

    Pizza.destroy_all
    Topping.destroy_all
    User.destroy_all

    pepperoni = Topping.create({name: "Pepperoni"})
    cheese = Topping.create({name: "Cheese"})
    peppers = Topping.create({name: 'Bell Peppers'})

    Pizza.create!([{
        name: "Pepperoni Pizza",
        toppings: [pepperoni, cheese]
    },
    {
        name: "Cheese Pizza",
        toppings: [cheese]
    }
    ])

    admin = User.create!({email: "admin@admin.com", password: "admin123"})
    admin.add_role :chef
    admin.add_role :owner

    chef = User.create!({email: "chef@pizza.com", password: "chef123"})
    chef.add_role :chef

    owner = User.create!({email: "owner@pizza.com", password: "owner123"})
    owner.add_role :owner