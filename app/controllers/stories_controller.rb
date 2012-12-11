class StoriesController < ApplicationController
  def committers
    @committers = {}
    story = Story.new(params["story"])
    story.instance_variable_set(:@token, session[:token])
    story.commits
    real_story = Story.find_by_number_and_repo_id(story.number, story.repo_id)
    commits = real_story.commits_without_sync

    commits.each do |commit|
      append_committers commit.committer1
      append_committers commit.committer2
    end
  end

  def append_committers committer
    @committers[committer.name] = (@committers[committer.name] + 1) rescue 1 if committer.present?
  end
end
