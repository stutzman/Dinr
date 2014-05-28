class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score
      t.string :comment
      t.timestamps
    end
  end
end
