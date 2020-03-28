require 'faker'
require 'open-uri'
require 'json'

puts 'destroying all cocktails'

Cocktail.destroy_all

puts 'destroying all ingredients'

Ingredient.destroy_all

puts 'seeding ingredients'

10.times do
  Ingredient.create!(name: Faker::Creature::Animal.name)
end

puts 'seeding cocktails'

10.times do
  Cocktail.create!(name: Faker::Address.street_name)
end

puts 'seeding doses'

Cocktail.all.each do |c|
  dose = Dose.new(description: Faker::Food.measurement)
  dose.cocktail = c
  dose.ingredient = Ingredient.all.sample
  dose.save!
end

puts 'all done'
