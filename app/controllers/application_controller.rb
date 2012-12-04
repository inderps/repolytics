class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_token

  def load_token
    if session[:token].nil?
      session[:redirect_url] = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
      redirect_to :controller => 'github', :action => 'authorize'
    end
  end

  def load_repo
    @repo = Repo.find_or_create_by_name(params[:repo])
  end
end
