class Recipe < ActiveRecord::Base

  def to_s
  	if rating == nil
    "-- #{name} -- \nDescription: #{description} - Length: #{length} minutes - Difficulty: #{difficulty}."

 		else
 		"-- #{name} -- \nDescription: #{description} - Length: #{length} minutes - Difficulty: #{difficulty} - Rating: #{rating}."
  	end
  end
end