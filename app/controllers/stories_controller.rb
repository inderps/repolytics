class StoriesController < ApplicationController
  def committers
    story = Story.new(params["story"])
    story.instance_variable_set(:@token, session[:token])
    commits = story.commits
    real_story = Story.find_by_number_and_repo_id(story.number,story.repo_id)
    commits = real_story.commits_without_sync
    committers = commits.collect(&:committer1)
    committers += commits.collect(&:committer2).compact
    @committers = committers.group_by{|c| c.name}.map{|k,v| {:name => k,:no_of_commits=>v.size}}
  end
end
