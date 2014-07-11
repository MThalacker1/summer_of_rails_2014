require 'bundler'
Bundler.require

require 'sinatra/base'

class MyApp < Sinatra::Base
  get "/" do
    @title = "Home"
    @message = "Hello World"
    erb :index
  end

  get "/links" do
    @links = [
      {:text => "Google", :href => "http://google.com"},
      {:text => "Hacker News", :href => "http://news.ycombinator.com"},
      {:text => "This Week in Tech", :href => "http://twit.tv/show/this-week-in-tech"}
    ]
    erb :links
  end
end
