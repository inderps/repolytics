class RepoController < ApplicationController
  before_filter :load_repo

  def index
    @repos = Repo.all(session[:token])
  end

  def show
    @story = Story.new(:repo => @repo.name, :owner => @repo.owner)
  end

  def settings
    @committers = @repo.committers
    render
  end
end
