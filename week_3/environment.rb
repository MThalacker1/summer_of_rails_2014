require 'rack'

class HelloApp
  def call(env)
    content = env.map {|key, value| "#{key} #{value}"}.sort.join("\n")
    if content.include? "Firefox"
      #content = "It's Firefox"
    end
    if content.include? "Internet Explorer"
      #content = "Why are you using Internet Explorer?"
    end
    if content.include? "Chrome"
      #content = "Hi, Chrome user!"
    end
    [200, {"Content-type" => "text/plain"}, [content]]
  end
end

app = HelloApp.new


server = Rack::Server.new :app => app, :server => "webrick"
server.start
