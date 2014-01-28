class Recipe < ActiveRecord::Base

	def to_s
		"-- #{name} -- \nDescription: #{description} - Length: #{length} minutes - Difficulty: #{difficulty}."
	end
end