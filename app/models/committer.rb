class Committer < ActiveRecord::Base
  attr_accessible :name

  belongs_to :repo
  has_many :commits
end
