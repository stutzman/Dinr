class AddCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.timestamps
    end
  end
end
