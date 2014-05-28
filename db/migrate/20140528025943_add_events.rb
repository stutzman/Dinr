class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :img_url
      t.integer :guest_number
      t.string :attire
      t.datetime :event_date
      t.time :start_time
      t.time :end_time
      t.string :food_bio
      t.timestamps
    end
  end
end
