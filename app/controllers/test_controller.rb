class TestController < ApplicationController
  def index
    @repos = Repo.all(:access_token => session[:token])
    require 'pry'
    binding.pry
  end
end
