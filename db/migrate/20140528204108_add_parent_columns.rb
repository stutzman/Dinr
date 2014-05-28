class AddParentColumns < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer

    add_column :events, :category_id, :integer

    add_column :reviews, :user_id, :integer

    add_column :reviews, :event_id, :integer

    add_column :commits, :user_id, :integer

    add_column :commits, :event_id, :integer
  end
end
