class Story < ActiveRecord::Base
  attr_accessible :number, :token, :repo, :repo_id
  has_many :commits
  belongs_to :repo

  def commits_with_sync
    sync_commits(self.repo, @token)
    commits_without_sync
  end

  alias_method_chain :commits, :sync

  def sync_commits repo, token
    sha = repo.commits_without_sync.last.try(:sha)
    while true do
      params = {:access_token => token, :_owner => repo.owner, :_repo => repo.name, :per_page=> 10}
      params.merge!(:last_sha => sha) if sha
      github_commits = Github::Commit.all(params)
      break if github_commits.empty?
      github_commits.each do |github_commit|
        msg = github_commit.commit[:message]
        committers = repo.committers.select{|committer| msg.include?(committer.name)}
        story = Story.find_or_create_by_number(msg.match(/#[\d]*/).to_s.gsub("#",""))
        repo.stories << story
        repo.commits_without_sync.create(:message => msg, :committer1 => committers.first, :committer2 => committers.second, :story => story, :sha => github_commit.sha)
      end
      sha = github_commits.last.sha
    end
  end

end
