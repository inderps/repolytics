class CreateCommitters < ActiveRecord::Migration
  def change
    create_table :committers do |t|
      t.string :name
      t.references :repo
      t.timestamps
    end
  end
end
