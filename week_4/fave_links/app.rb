require 'sinatra'
require 'sqlite3'

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
  results = CONNECTION.execute("select link, url, description from links ORDER BY ID DESC")
  tablerows = results.collect do |row|
    "<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td></tr>"
  end
  %Q{
    <form action="/links" method="POST">
    <label for="link">Name of Link:</label>
    <input type="text" name="link" id="link">
    <label for="url">URL:</label>
    <input type="text" name="url" id="url">
    <label for="description">Description:</label>
    <input type="text" name="description" id="description">
    <input type="submit">
    </form>
    <table>
      <tr>
      <th>Title</th>
      <th>URL</th>
      <th>Description</th>
      #{tablerows.join}
      </table>
  }
end

get "/" do
  results = CONNECTION.execute("select link, url, description from links ORDER BY ID DESC LIMIT 10")
  tablerows = results.collect do |row|
    "<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td></tr>"
  end
  %Q{
    <table>
      <tr>
      <th>Title</th>
      <th>URL</th>
      <th>Description</th>
      #{tablerows.join}
      </table>
  }
end

get "/links/:id" do
  id = params[id]
  results = CONNECTION.execute("select link, url, description from links where ID is equal to #{id}")
  tablerows = results.collect do |row|
    "<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td></tr>"
  end
end



