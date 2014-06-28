require 'rack'

class Home
  def call(env)
    content = %Q{
      <!DOCTYPE html> 
      <html lang="en-US">
      <head>
      <meta charset="UTF-8">
      </head>
      <body>
      <div id="wrapper">
      <h1><span>miahwalley.com</span><h1>
      <p>Welcome to my site! My name is Miah Walley and I am a brand new software
      developer from WI. I love learning new things, especially about technology!</p>
      <footer>
      <small>Miah Walley Copyright&copy; #{Date.today.year}<small>
      </footer>
      </body>
      </div>
      <html>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class AboutMe
  def call(env)
    content = %Q{
      <!DOCTYPE html> 
      <html lang="en-US">
      <head>
      <meta charset="UTF-8">
      </head>
      <body>
      <div id="wrapper">
      <h1><span>miahwalley.com</span><h1>
      <h2>About Me</h2>
      <p>Welcome to my site! My name is Miah Walley and I am a brand new software
      developer from WI. I love learning new things, especially about technology!</p>
      <footer>
      <small>Miah Walley Copyright&copy; #{Date.today.year}<small>
      </footer>
      </body>
      </div>
      <html>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class Resume
  def call(env)
    content = %Q{
      <!DOCTYPE html> 
      <html lang="en-US">
      <head>
      <meta charset="UTF-8">
      </head>
      <body>
      <div id="wrapper">
      <h1><span>miahwalley.com</span><h1>
      <h2>Resume</h2>
      <p>Welcome to my site! My name is Miah Walley and I am a brand new software
      developer from WI. I love learning new things, especially about technology!</p>
      <footer>
      <small>Miah Walley Copyright&copy; #{Date.today.year}<small>
      </footer>
      </body>
      </div>
      <html>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class Contact
  def call(env)
    content = %Q{
      <!DOCTYPE html> 
      <html lang="en-US">
      <head>
      <meta charset="UTF-8">
      </head>
      <body>
      <div id="wrapper">
      <h1><span>miahwalley.com</span><h1>
      <h2>Contact Me</h2>
      <form method="POST" action="/submit_contact">
      <label for="name">Name:</label>
      <input id="name"type="text" name="name"><br>
      <label for="email">Email:</label>
      <input id="email"type="text" name="email"><br>
      <label for="text">Questions?</label>
      <textarea id="text"type="text" name="text"></textarea>
      <input type ="submit">
      </form>
      <footer>
      <small>Miah Walley Copyright&copy; #{Date.today.year}<small>
      </footer>
      </body>
      </div>
      <html>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class SubmitContact
  def call(env)
    content = %Q{
      <!DOCTYPE html> 
      <html lang="en-US">
      <head>
      <meta charset="UTF-8">
      </head>
      <body>
      <div id="wrapper">
      <h1><span>miahwalley.com</span><h1>
      <h2>Contact Results</h2>
      }
     request = Rack::Request.new(env)
    name = request.POST["name"]
    content << "<p>Name: #{name}</p>" 
    email = request.POST["email"]
    content << "<p>Email: #{email}</p>" 
    questions = request.POST["text"]    
    content << "<p>Questions: #{questions}</p>" 
     content << %Q{<footer>
      <small>Miah Walley Copyright&copy; #{Date.today.year}<small>
      </footer>
      </body>
      </div>
      <html>
      }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = Rack::Builder.new do
  map "/" do
    run Home.new
  end
  map "/about" do
    run AboutMe.new
  end
  map "/resume" do
    run Resume.new
  end
  map "/contact" do
    run Contact.new
  end
  map "/submit_contact" do
    run SubmitContact.new
  end
end

server = Rack::Server.new :app => app, :server => "webrick"
server.start
