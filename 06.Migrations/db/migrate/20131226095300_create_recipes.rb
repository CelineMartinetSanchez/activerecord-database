class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :name, :text, limit: nil
      t.column :description, :text, limit: nil
      t.column :length, :integer
      t.column :difficulty, :integer
    end
  end

end