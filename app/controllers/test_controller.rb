class TestController < ApplicationController
  def index
    @repos = Github::Repo.all(:access_token => session[:token])
    require 'pry'
    binding.pry
  end
end
