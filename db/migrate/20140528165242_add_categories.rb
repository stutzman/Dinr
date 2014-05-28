class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :genre
    end
  end
end