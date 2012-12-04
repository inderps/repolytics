class CommittersController < ApplicationController
  before_filter :load_repo

 def create
   committers = @repo.committers.create(:name => params[:name])
   render :json => committers
 end

end
