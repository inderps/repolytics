class Committer < ActiveRecord::Base
  attr_accessible :name

  belongs_to :repo
  has_many :commits, :foreign_key => :committer1_id
  has_many :secondary_commits, :foreign_key => :committer2_id, :class_name => "Commits"
end
