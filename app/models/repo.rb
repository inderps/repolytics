class Repo < ActiveRecord::Base
  attr_accessible :name
  has_many :committers

  def self.all token
    repos = []
    github_repos = Github::Repo.all(:access_token => token)
    github_repos.each do |github_repo|
      repos << Repo.find_or_create_by_name_and_owner(github_repo.name,github_repo.owner[:login])
    end
    repos
  end
end
