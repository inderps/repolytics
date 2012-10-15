class GithubController < ApplicationController
  def authorize
    redirect_to("https://github.com/login/oauth/authorize?client_id=30d150e7363fbec11080&redirect_uri=http://localhost:3001/github/callback&state=random123456")
  end

  def callback
    token = User.token params[:code]
    session[:token] = token
    redirect_to :controller => 'test', :action => 'index'
  end
end
