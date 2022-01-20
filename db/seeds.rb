require 'faker'

20.times do
  new_restaurant = Restaurant.new
  new_restaurant.name = Faker::Restaurant.name
  new_restaurant.address = Faker::Address.full_address
  new_restaurant.phone_number = Faker::PhoneNumber.phone_number_with_country_code
  new_restaurant.category = Restaurant::CATEGORIES.sample
  new_restaurant.save

  rand(1..3).times do
    review = Review.new
    review.content = Faker::Restaurant.review
    review.rating = rand(1..5)
    review.restaurant = new_restaurant
    review.save
  end
end
