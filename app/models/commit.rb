class Commit < ActiveRecord::Base
  attr_accessible :sha, :message

  belongs_to :story
  belongs_to :repo

  belongs_to :committer1, :class_name => "Committer"
  belongs_to :committer2, :class_name => "Committer"
end
