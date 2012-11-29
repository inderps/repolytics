class StoriesController < ApplicationController
  def committers
    story = Story.new(params["story"].merge(:token => session[:token]))
    @committers = story.committers
  end
end
