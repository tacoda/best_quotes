require './config/application'
require 'rack'

# use Rack::ContentLength
# use Rack::ContentType
# use Rack::ShowExceptions
# use Rack::Static, urls: ["/public"]

# map "/" do
#   run QuotesController.action(:index)
# end

app = BestQuotes::Application.new

use Rack::ContentType

app.route do
  match "", "quotes#index"
  match "sub-app",
    proc { [200, {}, ["Hello, sub-app!"]] }

  # default routes
  match ":controller/:id/:action"
  match ":controller/:id",
    :default => { "action" => "show" }
  match ":controller",
    :default => { "action" => "index" }
end

run app
