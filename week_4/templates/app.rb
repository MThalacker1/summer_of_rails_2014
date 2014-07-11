require 'sinatra'


#not sure what he is talking about with the layout, re-read.
get "/name/:name" do
  name = params[:name]
  @greeting = "Hi, #{name}, how are you today?"
  erb :index
end


get "/people" do
  @people = [
    {first_name: "Homer", last_name: "Simpson"},
    {first_name: "Marge", last_name: "Simpson"},
    {first_name: "Bart", last_name: "Simpson"}
  ]
  erb :people
end

__END__




@@people
<h1>People</h1>
<% if @people.length > 0 %>
  <table>
    <% @people.each_with_index do |person, index| %>
      <tr>
        <td><%= person[:first_name] %> <%= person[:last_name]%></td>
      </tr>
    <% end %>
  </table>
<% else %>
  <p>What is this, the Zombie Apocalypse? There are no people here.</p>
<% end %>
