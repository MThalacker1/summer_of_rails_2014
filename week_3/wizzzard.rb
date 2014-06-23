require 'rack'

class Home

  def call(env)
    content = env
    if content["REQUEST_URI"] == "http://localhost:8080/" || content["REQUEST_URI"] == "http://localhost:8080/index.html"
      step = 'index.html'
    end
    if content["REQUEST_URI"] == "http://localhost:8080/new_page.html"
      step = 'new_page.html'
    end
    if content["REQUEST_URI"] == "http://localhost:8080/another_new_page.html"
      step = 'another_new_page.html'
    end
    if content["REQUEST_URI"] == "http://localhost:8080/the_end.html"
      step = 'the_end.html'
    end
    self.render_page(step)
  end
  
  def render_page(step)
      content = File.read(step)
    [200, {"Content-type" => "text/html"}, [content] ]
  end

end


home = Home.new


server = Rack::Server.new :app => home, :server => "webrick"
server.start

