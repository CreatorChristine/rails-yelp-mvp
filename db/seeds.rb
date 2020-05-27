# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing database..."
Review.destroy_all
Restaurant.destroy_all
puts "Database cleared. Creating 5 restaurants and their reviews..."

5.times do
    restaurant = Restaurant.create!(
        name: Faker::Restaurant.name, 
        address: Faker::Address.full_address, 
        category: Restaurant::CATEGORIES.sample, 
        phone_number: Faker::PhoneNumber.phone_number_with_country_code)
        puts "#{restaurant.name} made."
    restaurant_id = restaurant.id
    rand(1..10).times do
        review = Review.create!(content: Faker::ChuckNorris.fact , rating: Review::RATINGS.sample, restaurant_id: restaurant_id)
        puts "#{review.content}"
    end
end
