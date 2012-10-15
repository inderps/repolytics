class JsonAccept < Faraday::Middleware
  def initialize(app, options={})
    @options = options
    @app = app
  end

  def call(env)
    env[:request_headers]["Accept"] = "application/json"
    @app.call(env)
  end
end