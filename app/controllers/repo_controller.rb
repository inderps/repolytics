class RepoController < ApplicationController
  before_filter :load_repo

  def index
    @repos = Repo.all(session[:token])
  end

  def show
    @story = Story.new(:repo_id => @repo.id)
  end

  def settings
    @committers = @repo.committers
    render
  end
end
