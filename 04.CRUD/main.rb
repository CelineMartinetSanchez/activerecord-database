require 'sqlite3'

# creates the database
db_path = "db/cookbook.sqlite"
db = SQLite3::Database.new(db_path)

sql = %q{
  CREATE TABLE Recipe 
  (
  	Id integer primary key autoincrement,
  	Name varchar(255), 
  	Description varchar(255), 
  	Length int, 
  	Difficulty int
  	)
}
# db.execute(sql)

#*************************************

# function to create a recipe
def create_recipe(db,name,description,length,difficulty)
  db.execute("INSERT INTO Recipe (Name, Description, Length, Difficulty) VALUES ('#{name}', '#{description}', {length}, #{difficulty})")
end

# function to delete a recipe
def delete_recipe(db,id)
	db.execute("DELETE FROM Recipe.Name VALUE (#{name})")
end

# function to delete all recipes
def delete_all_recipes(db)
  db.execute("DELETE FROM Recipe")
end

# function to update a recipe
def update_recipe(db,id,description)
  db.execute("UPDATE Recipe SET Description=#{description} WHERE Id=#{id}")
end

def get_recipes(db)
  db.execute("SELECT * FROM Recipe").each {|row| puts row}
end


#*************************************

# program

puts "Salut Robuchon, what do you want to do today?"
puts "1. create a recipe"
puts "2. delete all recipes"
puts "3. read your recipes"

choice =  gets.chomp.to_i

if choice == 1
                puts "What is the name of the recipe?"
                name = gets.chomp
                puts "What is the description?"
                description = gets.chomp
                puts "What is the cooking time (in minutes)?"
                length = gets.chomp.to_i
                puts "What is the difficulty (on a scale of 3)?"
                difficulty = gets.chomp.to_i
                create_recipe(db, name, description, length, difficulty)
                puts "Added!"
  
elsif choice == 2
  delete_all_recipes(db)
  puts "You deleted all your recipes."
  
elsif choice == 3
  puts get_recipes(db)
end 
  
  
  
  
  
  
  
  