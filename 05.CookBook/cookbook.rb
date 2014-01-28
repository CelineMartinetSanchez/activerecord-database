require_relative 'config/application'
require './models/recipe'

# your program here

puts "Salut Robuchon, what do you want to do today?"
puts "1. create a recipe"
puts "2. delete a recipe"
puts "3. delete all recipes"
puts "4. read your recipes"

choice = gets.chomp.to_i

if choice == 1
	puts "Please enter a name."
	name = gets.chomp
	puts "Please enter a description."
	description = gets.chomp
	puts "What is the length? (on minutes)"
	length = gets.chomp.to_i
	puts "And the difficulty? (5 being the maximum)"
	difficulty = gets.chomp.to_i
  new_recipe = Recipe.create(name: name, description: description, length: length, difficulty: difficulty)
  puts "Thanks! You added the following recipe: #{new_recipe.to_s}"

elsif choice == 2
	puts "What recipe do you want to delete? Enter its id."
	puts "--------------------------"
	Recipe.all.each {|recipe| puts "#{recipe.name} : type #{recipe.id}"}
	id = gets.chomp
	Recipe.delete(id)

elsif choice == 3
	Recipe.delete_all()
 
elsif choice == 4
  puts Recipe.all
  
else
  puts "i did not understand"
  
end