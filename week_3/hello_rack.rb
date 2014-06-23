require 'rack'

class HelloApp
  def call(env)
  content = %Q{
  <p>
    Look at that snazzy formatting!
  </p>
  <p>
  I can even use string interpolation
  </p>
  <h2>Today's date is #{Date.today}</h2>
  }
    
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = HelloApp.new


server = Rack::Server.new :app => app, :server => "webrick"
server.start

