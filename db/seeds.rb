require 'faker'
require 'open-uri'
require 'json'

puts 'destroying all cocktails'

Cocktail.destroy_all

puts 'destroying all ingredients'

Ingredient.destroy_all

puts 'seeding ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list = open(url).read
ingredients = JSON.parse(list)

ingredients['drinks'].each do |d|
  Ingredient.create!(name: d.values[0])
end

puts 'seeding cocktails'

10.times do
  Cocktail.create!(name: Faker::Hipster.word)
end

puts 'all done'
