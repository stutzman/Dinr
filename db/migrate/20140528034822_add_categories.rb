class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :type
    end
  end
end
