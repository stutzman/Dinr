class AddUserColumns < ActiveRecord::Migration
  def change

    add_column :users, :city, :string

    add_column :users, :state_province, :string

    add_column :users, :country, :string

  end
end
