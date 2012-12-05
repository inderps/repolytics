module RepoSync
  def sync_commits repo, token
    while true do
      params = {:access_token => token, :_owner => repo.owner, :_repo => repo.name, :per_page=> 10}
      sha = repo.commits.last.sha
      params.merge!(:last_sha => sha) if sha
      github_commits = GitHub::Commit.all(params)
      break if github_commits.empty?
      github_commits.each { |github_commit| repo.commits.create(:message => github_commit.commit[:message]) }
    end
  end

end