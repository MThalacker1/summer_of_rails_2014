class Header
  def initialize(app)
    @app = app
  end
  def call(env)
    response_body  "<a href='search_form.rb' alt='Search'>\n<a href='browse.rb' alt='Browse'>"
    status, headers, response = @app.call(env)
    response_body = response.join("\n")
    headers["Content-length"] = response_body.length.to_s
    [status, headers, [response_body]]
  end
end
