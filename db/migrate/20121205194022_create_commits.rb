class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :message
      t.references :repo
      t.references :story
      t.references :committer1
      t.references :committer2
      t.timestamps
    end
  end
end
