class Repo < ActiveRecord::Base
  attr_accessible :name
  has_many :committers
  has_many :commits

  def self.all token
    repos = []
    github_repos = Github::Repo.all(:access_token => token)
    github_repos.each do |github_repo|
      repos << Repo.find_or_create_by_name_and_owner(github_repo.name,github_repo.owner[:login])
    end
    repos
  end

  def test token
    sync_commits(self, token)
  end

  def sync_commits repo, token
    sha = repo.commits.last.try(:sha)
    while true do
      params = {:access_token => token, :_owner => repo.owner, :_repo => repo.name, :per_page=> 10}
      params.merge!(:last_sha => sha) if sha
      github_commits = Github::Commit.all(params)
      binding.pry
      break if github_commits.empty?
      github_commits.each { |github_commit| repo.commits.create(:message => github_commit.commit[:message]) }
      sha = github_commits.last.sha
    end
  end
end
