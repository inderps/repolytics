class StoriesController < ApplicationController
  def committers
    story = Story.new(params["story"])
    story.instance_variable_set(:@token, session[:token])
    story.commits
    real_story = Story.find_by_number_and_repo_id(story.number, story.repo_id)
    commits = real_story.commits_without_sync
    committers = commits.collect { |commit| [commit.committer1, commit.committer2] }.flatten.compact
    @committers = committers.group_by { |c| c.name }.map { |k, v| {:name => k, :no_of_commits=>v.size} }
  end
end
