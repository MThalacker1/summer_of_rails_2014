require 'rack'

require_relative 'handle_results'
require_relative 'products'
require_relative 'product_catalog'
require_relative 'search_form'
require_relative 'browse'
require_relative 'footer'

class Application

  def self.run
    app = Rack::Builder.new do
      use Footer
      map "/" do
        run SearchForm.new
      end
      map "/search" do
        run HandleResults.new
      end
      map "/browse" do
        run Browse.new
      end
    end
  end
end


