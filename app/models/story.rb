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
    github_commits = []
    sha = repo.commits_without_sync.last.try(:sha)
    params = {:access_token => token, :_owner => repo.owner, :_repo => repo.name, :per_page => 10}
    while true do
      is_last_sha = false
      commits = Github::Commit.all(params)
      commits.each do |commit|
        is_last_sha = true and break if (commit.sha == sha)
        github_commits << commit
      end
      break if is_last_sha or commits.empty?
      sha = commits.last.sha
      params.merge!(:last_sha => sha) if sha
    end
    github_commits.reverse.each do |github_commit|
      msg = github_commit.commit[:message]
      committers = repo.committers.select { |committer| msg.include?(committer.name) }
      story_no = extract_story_no msg
      if story_no.present?
        story = Story.find_or_create_by_number(extract_story_no(msg))
        repo.stories << story
      end
      repo.commits_without_sync.create(:message => msg, :committer1 => committers.first, :committer2 => committers.second, :story => story, :sha => github_commit.sha)
    end
  end

  private
  def extract_story_no(msg)
    msg.match(/#[\d]*/).to_s.gsub("#", "")
  end
end
