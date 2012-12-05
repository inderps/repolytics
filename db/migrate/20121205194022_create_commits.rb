class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :message
      t.references :repo
      t.references :story
      t.references :commtter1
      t.references :commtter2
      t.timestamps
    end
  end
end
