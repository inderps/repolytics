class StoriesController < ApplicationController
  def committers
    story = Story.new(params["story"])
    story.instance_variable_set(:@token, session[:token])
    commits = story.commits
    @committers = commits.collect(&:committers)
  end
end
