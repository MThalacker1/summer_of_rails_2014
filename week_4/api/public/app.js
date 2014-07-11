response = $.ajax({
  url: "/quotes.json",
  dataType: "JSON",
  method: "GET"
});

response.success(function(data){
  var html, quotes, ul;

  var ul = $("#quotes");
  quotes = data;
  
  $.each(quotes, function(index, quote){
    html = "<li>";
    html += quote["text"] + " - " + quote["person"];
    html += "</li>";

    html = $(html);
    ul.append(html);
  });
  
});
