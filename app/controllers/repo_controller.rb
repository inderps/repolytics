class RepoController < ApplicationController
  def index
    @repos = Repo.all(:access_token => session[:token])
  end

  def show
    @story = Story.new(:repo => params[:repo], :owner => params[:owner])
  end
end
