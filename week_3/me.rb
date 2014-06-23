require 'rack'

class Me
  def call(env)
    content = File.read('index.html')
    [200, {"Content-type" => "text/html"}, [content] ]
  end
end

me = Me.new

server = Rack::Server.new :app => me, :server => "webrick"
server.start
