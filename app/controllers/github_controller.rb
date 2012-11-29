class GithubController < ApplicationController
  skip_before_filter :load_token

  def authorize
    redirect_to("https://github.com/login/oauth/authorize?client_id=30d150e7363fbec11080&redirect_uri=http://localhost:3001/github/callback&state=random123456")
  end

  def callback
    token = User.token params[:code]
    user = User.me(token)
    session[:token] = token
    session[:user] = user
    redirect_to(session[:redirect_url])
  end
end
