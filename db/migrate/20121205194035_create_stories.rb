class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :number
      t.references :repo
      t.timestamps
    end
  end
end
