require 'sinatra/base'
require 'sqlite3'

class FaveLinks <  Sinatra::Base
CONNECTION = SQLite3::Database.new("fave_links.sqlite3")

CONNECTION.execute <<-SQL
CREATE TABLE IF NOT EXISTS "links" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "link" VARCHAR,
  "url"  VARCHAR,
  "description" VARCHAR
)
SQL
post "/links" do
  link = params[:link]
  url = params[:url]
  description = params[:description]

  CONNECTION.execute("INSERT INTO links (link, url, description)
                     VALUES (?,?,?)", [link, url, description])
  redirect "/links"
end

get "/links" do
  @results = CONNECTION.execute("select link, url, description from links ORDER BY ID DESC")
  erb :links
end

get "/" do
  @results = CONNECTION.execute("select link, url, description from links ORDER BY ID DESC LIMIT 10")
  erb :list
end

get "/links/:id" do
  id = params[:id]
 @results = CONNECTION.execute("select link, url, description from links where ID = (?)", [id])
  erb :links_id
end

end

      
  
