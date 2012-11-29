class RepoController < ApplicationController
  def index
    @repos = Repo.all(:access_token => session[:token])
  end

  def show
    @commits = Commit.all(:access_token => session[:token], :_owner => params[:owner], :_repo => params[:id])
    require 'pry'
    binding.pry
  end
end
