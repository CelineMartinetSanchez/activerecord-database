require 'sqlite3'

# opens the database
database_path = "db/jukebox.sqlite"
db = SQLite3::Database.new(database_path)

def number_of_rows(db,table_name)
  n = db.execute("SELECT COUNT(*) from #{table_name};")
  n[0][0]
end

puts "There are #{number_of_rows(db,"Artist")} artists"
puts "There are #{number_of_rows(db,"Track")} tracks"
puts "There are #{number_of_rows(db,"Album")} albums"
puts "There are #{number_of_rows(db,"Genre")} genres"
puts "There are #{number_of_rows(db,"MediaType")} media types"

puts "**********************************************************"

def order(table_name)
	db.execute("SELECT * FROM #{table_name}; ORDER BY #{db}")
end

# # returns all the artists sorted by alphabetical order.
artists = db.execute("SELECT Name FROM Artist; ORDER BY Name")
puts artists

puts "**********************************************************"

# # returns all the love songs
love_songs = db.execute("SELECT Name FROM Track WHERE Name LIKE '%love%'")
puts love_songs

puts "**********************************************************"

# returns all the tracks that are longer than 5 minutes.
long_tracks = db.execute("SELECT Name FROM Track WHERE Milliseconds > 300000")
puts long_tracks