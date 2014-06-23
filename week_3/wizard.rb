require 'rack'

module Render
  def render_page(step)
    content = File.read(step)
    [200, {"Content-type" => "text/html"}, [content] ]
  end
end
  include Render
page =Rack::Builder.new do
    map '/index.html' do
      run lambda { |env|
      step = 'index.html'
      self.render_page(step)
    }
    end
      map "/new_page.html" do
      run lambda { |env|
      step = "new_page.html"
    self.render_page(step) 
    }
    end
      map "/another_new_page.html" do
      run lambda { |env|
      step = "another_new_page.html"
    self.render_page(step)
    }
    end
      map "/the_end.html" do
      run lambda { |env|
      step = "the_end.html"
    self.render_page(step)
    }
    end
end

server = Rack::Server.new :app => page, :server => "webrick"
server.start
