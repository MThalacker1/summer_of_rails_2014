require 'sinatra'

get "/:name" do
  name = params[:name]
  
  @title = "Home"
  @message = "Hello World"
  @greeting = "Hi, #{name}, how are you today?"
  erb :index
end

get "/links" do
  @links = []
  erb :links
end

__END__

@@index
<h1><%= @message %></h1>  
<p><%= Date.today %></p>
<h2><%= @greeting %></h2>


@@layout
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <title><%= @title %></title>
  </head>
  <body>
    <header>
      <h1>Welcome App</h1>
    </header>
    <section class="main">
      <%= yield %>
    </section>
    <footer>
      Copyright &copy; <%= Date.today.year %> Miah Walley
    </footer>
  </body>
</html>
