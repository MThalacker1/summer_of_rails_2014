class Browse
  def call(env)
    content = ""
    catalog = ProductCatalog.new
    products = catalog.find_all_by_keyword("")
    products.each do |product|
    content << "<p>#{product.name}: #{product.price}</p>"
    end
  [200, {"Content-type" => "text/html"}, [content]]
  end
end
