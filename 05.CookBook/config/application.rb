require 'sqlite3'
require 'active_record'

ActiveRecord::Base.configurations = YAML::load(IO.read(File.join(File.dirname(__FILE__),'database.yml')))
ActiveRecord::Base.establish_connection('development')


# Migrations
# Create the migration for the Recipe table
unless ActiveRecord::Base.connection.tables.include? "recipes"
  ActiveRecord::Schema.define do
    create_table :recipes do |t|
      t.column :name, :text, limit: nil
      t.column :description, :text, limit: nil
      t.column :length, :integer
      t.column :difficulty, :integer       
    end
  end
end